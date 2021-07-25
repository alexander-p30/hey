#!/bin/bash

sleep_time=30

notification_loop () {
  while true; do send_notification "$1"; sleep $2; done
}

send_notification () {
  notify-send "Hey! $1"
}

show_help () {
  echo -e "Usage:\n\t-h\tshow help menu;\n\t-m\tset notification message;\n\t-t\tset sleep time in seconds (default = 30s);"
}

while getopts 'hm:t:' flag; do
  case "${flag}" in
    h) show_help; exit;;
    m) message="${OPTARG}" ;;
    t) sleep_time="${OPTARG}" ;;
    *) break ;;
  esac
done

notification_loop "$message" $sleep_time

