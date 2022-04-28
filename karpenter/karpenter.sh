#!/bin/bash

helm repo add karpenter https://charts.karpenter.sh/
helm repo update

# helm upgrade --install --namespace karpenter --create-namespace --values values.yaml \
#   karpenter karpenter/karpenter \
#   --version ${KARPENTER_VERSION} \
#   --set serviceAccount.annotations."eks\.amazonaws\.com/role-arn"=${KARPENTER_IAM_ROLE_ARN} \
#   --set clusterName=${CLUSTER_NAME} \
#   --set clusterEndpoint=${CLUSTER_ENDPOINT} \
#   --set aws.defaultInstanceProfile=KarpenterNodeInstanceProfile-${CLUSTER_NAME} \
#   --wait

   # for the defaulting webhook to install before creating a Provisioner   

helm upgrade --install karpenter karpenter/karpenter --namespace karpenter \
   --version 0.9.0 \
   -f values.yaml \
   --wait