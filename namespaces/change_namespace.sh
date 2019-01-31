#!/bin/bash

SOME_OPTIONS=(kube-system ingress default)
show_menu() {
	local n=1
	for ns in ${SOME_OPTIONS[@]}; do
		echo "$n. $ns"
		(( n += 1 ))
	done
}

read_options(){
	local choice
	read -p "Choose a namespace [1 - ${#SOME_OPTIONS[@]}] " choice
	echo "kubectl config set-context $(kubectl config current-context) --namespace=${SOME_OPTIONS[ (( choice - 1 )) ]}"
}

show_menu
read_options
