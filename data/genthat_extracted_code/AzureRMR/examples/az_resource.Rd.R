library(AzureRMR)


### Name: az_resource
### Title: Azure resource class
### Aliases: az_resource
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D # recommended way to retrieve a resource: via a resource group object
##D # storage account:
##D stor <- resgroup$get_resource(type="Microsoft.Storage/storageAccounts", name="mystorage")
##D # virtual machine:
##D vm <- resgroup$get_resource(type="Microsoft.Compute/virtualMachines", name="myvm")
##D 
##D ## carry out operations on a resource
##D 
##D # storage account: get access keys
##D stor$do_operation("listKeys", http_verb="POST")
##D 
##D # virtual machine: run a script
##D vm$do_operation("runCommand",
##D     body=list(
##D         commandId="RunShellScript", # RunPowerShellScript for Windows
##D         script=as.list("ifconfig > /tmp/ifconfig.out")
##D     ),
##D     encode="json",
##D     http_verb="POST")
##D 
##D ## retrieve properties
##D 
##D # storage account: endpoint URIs
##D stor$properties$primaryEndpoints$file
##D stor$properties$primaryEndpoints$blob
##D 
##D # virtual machine: hardware profile
##D vm$properties$hardwareProfile
##D 
##D ## update a resource: resizing a VM
##D properties <- list(hardwareProfile=list(vmSize="Standard_DS3_v2"))
##D vm$do_operation(http_verb="PATCH",
##D     body=list(properties=properties),
##D     encode="json")
##D 
##D # sync with Azure: useful to track resource creation/update status
##D vm$sync_fields()
##D 
##D # delete a resource
##D stor$delete()
##D 
## End(Not run)



