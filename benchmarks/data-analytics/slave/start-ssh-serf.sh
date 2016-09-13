#!/bin/bash

sed -i "s/master.cloudsuite.com/${JOIN_IP}/g" $HADOOP_PREFIX/etc/hadoop/core-site.xml
sed -i "s/master.cloudsuite.com/${JOIN_IP}/g" $HADOOP_PREFIX/etc/hadoop/yarn-site.xml

# start sshd
echo "start sshd..."
service ssh start

# start sef
echo -e "\nstart serf..." 
/etc/serf/start-serf-agent.sh > serf_log &

sleep 5

serf members

