#!/bin/bash

## create new dokuwiki site in /var/www/sites/domain.ext
## default login: admin/admin

if [ $# -ne 1 ]
then
  echo "Usage: `basename $0` domain.tld"
  exit $E_BADARGS
fi

mkdir /var/www/sites/$1
cd /var/www/sites/$1
git clone git@github.com:moba/dokuwiki.git htdocs
cd htdocs
git remote add upstream https://github.com/splitbrain/dokuwiki.git
git checkout -b stable origin/stable 
mkdir data/cache # git doesn't track empty dirs
cd lib/tpl/
git clone git@github.com:moba/dokuwiki-minimal.git minimal

