#!/bin/bash
set -e
LOGFILE=/home/techtrol/web_techtrol/logs/deploy.log
LOGDIR=$(dirname $LOGFILE)
# formula 1 + 2 * number of cpus cores
NUM_WORKERS=3
# user/group to run as
USER=techtrol
GROUP=techtrol
cd /home/techtrol/web_techtrol/website
source ../bin/activate
test -d $LOGDIR || mkdir -p $LOGDIR
exec ../bin/gunicorn techtrol.wsgi:application -w $NUM_WORKERS
  --user=$USER --group=$GROUP --log-level=debug
  --log-file=$LOGFILE 2>>$LOGFILE 
