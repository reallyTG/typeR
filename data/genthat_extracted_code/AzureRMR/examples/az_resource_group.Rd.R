library(AzureRMR)


### Name: az_resource_group
### Title: Azure resource group class
### Aliases: az_resource_group
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D # recommended way to retrieve a resource group object
##D rg <- az_rm$
##D     new(tenant="myaadtenant.onmicrosoft.com", app="app_id", password="password")$
##D     get_subscription("subscription_id")$
##D     get_resource_group("rgname")
##D 
##D # list resources & templates in this resource group
##D rg$list_resources()
##D rg$list_templates()
##D 
##D # get a resource (virtual machine)
##D rg$get_resource(type="Microsoft.Compute/virtualMachines", name="myvm")
##D 
##D # create a resource (storage account)
##D rg$create_resource(type="Microsoft.Storage/storageAccounts", name="mystorage",
##D     kind="StorageV2",
##D     sku=list(name="Standard_LRS"))
##D 
##D # delete a resource
##D rg$delete_resource(type="Microsoft.Storage/storageAccounts", name="mystorage")
##D 
##D # deploy a template
##D rg$deploy_template("tplname",
##D     template="template.json",
##D     parameters="parameters.json")
##D 
##D # deploy a template with parameters inline
##D rg$deploy_template("mydeployment",
##D     template="template.json",
##D     parameters=list(parm1="foo", parm2="bar"))
##D 
##D # delete a template and free resources
##D rg$delete_template("tplname", free_resources=TRUE)
##D 
##D # delete the resource group itself
##D rg$delete()
##D 
## End(Not run)



