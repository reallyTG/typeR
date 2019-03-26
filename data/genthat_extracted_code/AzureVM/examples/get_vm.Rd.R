library(AzureVM)


### Name: get_vm
### Title: Get existing virtual machine(s)
### Aliases: get_vm get_vm_cluster list_vms

### ** Examples

## Not run: 
##D 
##D sub <- AzureRMR::az_rm$
##D     new(tenant="myaadtenant.onmicrosoft.com", app="app_id", password="password")$
##D     get_subscription("subscription_id")
##D 
##D sub$list_vms()
##D sub$get_vm("myVirtualMachine")
##D 
##D rg <- sub$get_resource_group("rgname")
##D rg$get_vm("myOtherVirtualMachine")
##D 
## End(Not run)



