#!/bin/bash
#
# Bootstrap workstation with Ansible
#
# Author: Egidio Docile
#
#
set -o errexit
set -o pipefail
set -o nounset


BOOTSTRAP_DIRECTORY="$(realpath "$(dirname "$0")")"
BOOTSTRAP_VIRTUALENV="${BOOTSTRAP_DIRECTORY}/venv"

virtualenv "${BOOTSTRAP_VIRTUALENV}"
source "${BOOTSTRAP_VIRTUALENV}/bin/activate"

pip install \
  --require-virtualenv \
  --requirement "${BOOTSTRAP_DIRECTORY}/requirements.txt"

ansible-galaxy install --role-file="${BOOTSTRAP_DIRECTORY}/requirements.yml"
