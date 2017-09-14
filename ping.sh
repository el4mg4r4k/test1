#!/bin/bash

#target=$1
LOG=IPS.Log.file
# Log for Unp[ingable Servers
UNPING=IPS_UNPING.log
echo "">$UNPING
# Log for Pingable Servers
PING=IPS_PING.log
echo "">$PING

for target in $(cat ips)
do
count=$( ping -c 1 $target | grep icmp* | wc -l )

if [ $count -eq 0 ]
then
   echo $target  >> $UNPING
    echo $target " is not on the network as of " `date` >> $LOG
else


    echo $target >> $PING
    echo $target " is on the network as of " `date` >> $LOG
fi

done
