#! /bin/sh
me=$(basename $0)
server_id=$1
if [ -z $server_id ];
then
	echo "usage:$me server_id"
	exit 1
fi
pids=$(ps x | grep _$server_id | grep -v grep| awk '{print $1}')
if [ -z "$pids" ];
then
	echo "server $server_id not exist"
	exit 0
fi
echo "killing... $pids"
kill -9 $pids
