#!/bin/bash

cat > cities-controller.json <<EOF
{
  "kind": "ReplicationController",
  "apiVersion": "v1",
  "metadata": {
    "name": "datascience",
    "labels": {
      "name": "datascience"
    }
  },
  "spec": {
    "replicas": 3,
    "selector": {
      "name": "datascience"
    },
    "template": {
      "metadata": {
        "labels": {
          "name": "datascience",
          "deployment": "${WERCKER_GIT_COMMIT}"
        }
      },
      "spec": {
        "containers": [
          {
            "imagePullPolicy": "Always",
            "image": "quay.io/boersmamarcel/werckertest:${WERCKER_GIT_COMMIT}",
            "name": "datascience",
            "ports": [
              {
                "name": "http-server",
                "containerPort": 5000,
                "protocol": "TCP"
              }
            ]
          }
        ]
      }
    }
  }
}
EOF
