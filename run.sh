#!/bin/bash

kubectl_command=$WERCKER_KUBECTL_COMMAND
insecure_verify="false"

if [ "$WERCKER_KUBECTL_INSECURE_SKIP_TLS_VERIFY" = "true" ] ; then
  insecure_verify="true"
fi

if [ -n "$WERCKER_KUBECTL_IMAGE" ] ; then
  kubectl_command="$kubectl_command --image=$WERCKER_KUBECTL_IMAGE"
fi

pwd
ls

cd "$WERCKER_STEP_ROOT"

pwd
ls

chmod +x kubectl

kubectl "$kubectl_command --server=$WERCKER_KUBECTL_SERVER --token=$WERCKER_KUBECTL_SERVER --insecure-skip-tls-verify=$insecure_verify"
