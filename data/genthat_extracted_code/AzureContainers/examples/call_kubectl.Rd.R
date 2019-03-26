library(AzureContainers)


### Name: call_kubectl
### Title: Call the Kubernetes commandline tool, kubectl
### Aliases: call_kubectl

### ** Examples

## Not run: 
##D 
##D # without any args, prints the kubectl help screen
##D call_kubectl()
##D 
##D # append "--help" to get help for a command
##D call_kubectl("create --help")
##D 
##D # deploy a service from a yaml file
##D call_kubectl("create -f deployment.yaml")
##D 
##D # get deployment and service status
##D call_kubectl("get deployment")
##D call_kubectl("get service")
##D 
## End(Not run)



