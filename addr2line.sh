#!/bin/bash

while IFS= read line
do
	if [[ $line == '    '* ]]; then
	  addr=`echo $line | sed 's/[^ ]* \[\(0x[0-9a-f]*\)\]/\1/'`
	  echo -n '    '
	  eu-addr2line --pid=$1 --pretty-print --demangle --functions $addr
	else
	  echo $line
	fi
done
