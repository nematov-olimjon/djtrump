#!/bin/sh

ssh root@104.236.57.112 <<EOF
  cd djtrump
  git pull
  source /opt/envs/djtrump/bin/activate
  pip install -r requirements.txt
  ./manage.py migrate
  gunicorn --workers 3 --bind 0.0.0.0:8030 djtrump.wsgi --reload
  sudo supervisorctl restart djtrump
  exit
EOF
