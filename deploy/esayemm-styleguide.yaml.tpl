# vim: set syntax=yaml:

# Service
apiVersion: v1
kind: Service
metadata:
  name: esayemm-styleguide
  labels:
    run: esayemm-styleguide
    subdomain: esayemm-styleguide
spec:
  type: NodePort
  ports:
  - port: 80 # port to serve service on
    targetPort: 80 # containers port
    protocol: TCP
  selector:
    app: esayemm-styleguide
  # sessionAffinity: ClientIP

---

# Deployment
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: esayemm-styleguide
spec:
  replicas: 1
  # pod definition
  template:
    metadata:
      labels:
        app: esayemm-styleguide
    spec:
      containers:
      - name: esayemm-styleguide
        image: {{IMAGE_NAME}}
        ports:
        - containerPort: 80
