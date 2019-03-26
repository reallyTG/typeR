library(AzureVM)


### Name: list_vm_sizes
### Title: List available VM sizes
### Aliases: list_vm_sizes

### ** Examples

## Not run: 
##D 
##D sub <- AzureRMR::az_rm$
##D     new(tenant="myaadtenant.onmicrosoft.com", app="app_id", password="password")$
##D     get_subscription("subscription_id")
##D 
##D sub$list_vm_sizes("australiaeast")
##D 
##D # same output as above
##D rg <- sub$create_resource_group("rgname", location="australiaeast")
##D rg$list_vm_sizes()
##D 
## End(Not run)



