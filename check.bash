#! /usr/bin/env bash

# Author: johanb10
# Copyright 2020 johanb10
# License: GPLv3 or later

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

echo "Checking your privilege now..."

if [[ -n "$1" ]]; then
  USER_GROUPS="$(groups $1)"
else
  USER_GROUPS="$(groups)"
fi

if [[ -z $USER_GROUPS ]]; then
  echo "Congrats, you're the most underprivileged person alive"
elif [[ $USER_GROUPS =~ "root" ]]; then
  echo "Time to admit it, your privilege is over 9000"
elif [[ $USER_GROUPS =~ "sudo" || $USER_GROUPS =~ "wheel" ]]; then
  echo "You're not the most privileged person alive, but you should keep it in check anyways"
else echo "You have basic privilege, but nothing too excessive"
fi
