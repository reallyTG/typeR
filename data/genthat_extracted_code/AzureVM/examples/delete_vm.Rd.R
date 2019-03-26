library(AzureVM)


### Name: delete_vm
### Title: Delete virtual machine
### Aliases: delete_vm delete_vm_cluster

### ** Examples

## Not run: 
##D 
##D sub <- AzureRMR::az_rm$
##D     new(tenant="myaadtenant.onmicrosoft.com", app="app_id", password="password")$
##D     get_subscription("subscription_id")
##D 
##D sub$delete_vm("myWindowsDSVM")
##D sub$delete_vm("myLinuxDSVM")
##D 
## End(Not run)



