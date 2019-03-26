library(AzureVM)


### Name: az_vm_template
### Title: Virtual machine cluster template class
### Aliases: az_vm_template
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D # recommended way to retrieve a VM: via a resource group or subscription object
##D sub <- AzureRMR::az_rm$
##D     new(tenant="myaadtenant.onmicrosoft.com", app="app_id", password="password")$
##D     get_subscription("subscription_id")
##D 
##D vm <- sub$get_vm("myLinuxDSVM")
##D 
##D # start the VM
##D vm$start()
##D 
##D # run a shell command
##D vm$run_script("ifconfig > /tmp/ifc.out")
##D 
##D # stop (and deallocate) the VM
##D vm$stop()
##D 
##D # resize the VM
##D vm$resize("Standard_DS13_v2")
##D 
##D # get the VM status
##D vm$sync_vm_status()
##D 
## End(Not run)



