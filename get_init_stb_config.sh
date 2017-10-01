#!/bin/sh

. /lib/lsb/init-functions

cd /etc/init.d
set +e
for i in `seq 1 60`
do
   log_daemon_msg "Trying to get init_stb_config file using wget. Try $i" 
   sudo wget --no-check-certificate https://github.com/cstinv/stbdev/raw/master/init_stb/init_stb_config.sh
   if [ -f /etc/init.d/init_stb_config.sh ]; then
      break;
   fi
   sleep 1
done
chmod 774 init_stb_config.sh
. /etc/init.d/init_stb_config.sh
log_end_msg 0

