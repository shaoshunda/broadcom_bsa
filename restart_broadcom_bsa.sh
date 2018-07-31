#!/bin/sh

mkdir -p /userdata/bsa/config/
cd /userdata/bsa/config/
echo 0 > /sys/class/rfkill/rfkill0/state
sleep 1
echo 1 > /sys/class/rfkill/rfkill0/state
sleep 1
bsa_server -d /dev/ttyS4 -p /system/etc/firmware/BCM4345C0.hcd -r 13 -b /userdata/btsnoop.cfa > /userdata/bsa/bsa_log.txt &
sleep 1
app_manager -s
