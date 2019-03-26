library(AzureContainers)


### Name: kubernetes_cluster
### Title: Kubernetes cluster class
### Aliases: kubernetes_cluster
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D # recommended way of retrieving a cluster: via a resource group object
##D rg <- AzureRMR::az_rm$
##D     new(tenant="myaadtenant.onmicrosoft.com", app="app_id", password="password")$
##D     get_subscription("subscription_id")$
##D     get_resource_group("rgname")
##D 
##D # get the cluster endpoint
##D kubclus <- rg$get_aks("mycluster")$get_cluster()
##D 
##D # get registry authentication secret
##D kubclus$create_registry_secret(rg$get_acr("myregistry"))
##D 
##D # deploy a service
##D kubclus$create("deployment.yaml")
##D 
##D # can also supply the deployment parameters inline
##D kubclus$create("
##D apiVersion: extensions/v1beta1
##D kind: Deployment
##D metadata:
##D   name: model1
##D spec:
##D   replicas: 1
##D   template:
##D     metadata:
##D       labels:
##D         app: model1
##D     spec:
##D       containers:
##D       - name: model1
##D         image: myregistry.azurecr.io/model1
##D         ports:
##D         - containerPort: 8000
##D       imagePullSecrets:
##D       - name: myregistry.azurecr.io
##D ---
##D apiVersion: v1
##D kind: Service
##D metadata:
##D   name: model1-svc
##D spec:
##D   selector:
##D     app: model1
##D   type: LoadBalancer
##D   ports:
##D   - protocol: TCP
##D     port: 8000")
##D 
##D # track status
##D kubclus$get("deployment")
##D kubclus$get("service")
##D 
## End(Not run)



