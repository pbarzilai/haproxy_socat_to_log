#!/bin/bash

while true
do 
	NEW_LN=$(echo "show errors" | socat unix-connect:/var/lib/haproxy/stats stdio | head -1 | cut -d" " -f7)
	#if value is in specific lines in file:
	if ! cat haproxy_errors.txt | grep "Total events captured on..........................." | cut -d" " -f7 | grep $NEW_LN
	then
		echo "show errors" | socat unix-connect:/var/lib/haproxy/stats stdio >> haproxy_errors.txt
	else
		:
	fi
	sleep 60
done 