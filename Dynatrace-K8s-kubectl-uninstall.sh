#!/bin/sh
# Joshua D. Wood - josh.wood@dynatrace.com
# 3/26/2021
# v. 1.0
# Issues all cleanup commands for Dynatrace K8s Operator
# Includes removal of pod security policies, cluster roles,
# cluster role bindings, and web hooks

kubectl delete -n dynatrace oneagent --all
kubectl delete -f https://github.com/Dynatrace/dynatrace-oneagent-operator/releases/latest/download/kubernetes.yaml
kubectl delete namespaces dynatrace
kubectl delete podsecuritypolicies.policy dynatrace-kubernetes-monitoring
kubectl delete podsecuritypolicies.policy dynatrace-operator
kubectl delete clusterrole dynatrace-kubernetes-monitoring
kubectl delete clusterrole dynatrace-operator
kubectl delete clusterrolebinding dynatrace-kubernetes-monitoring
kubectl delete clusterrolebinding dynatrace-operator
kubectl delete validatingwebhookconfigurations.admissionregistration.k8s.io dynatrace-oneagent-webhook

echo "Full Dynatrace uninstall of Kubernetes complete."
