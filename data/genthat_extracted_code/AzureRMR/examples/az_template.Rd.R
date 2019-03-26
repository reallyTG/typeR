library(AzureRMR)


### Name: az_template
### Title: Azure template class
### Aliases: az_template
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D # recommended way to deploy a template: via a resource group object
##D 
##D tpl <- resgroup$deploy_template("mydeployment",
##D     template="template.json",
##D     parameters="parameters.json")
##D 
##D # retrieve list of created resource objects
##D tpl$list_resources()
##D 
##D # delete template (will not touch resources)
##D tpl$delete()
##D 
##D # delete template and free resources
##D tpl$delete(free_resources=TRUE)
##D 
## End(Not run)



