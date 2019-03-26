library(AzureVM)


### Name: create_vm
### Title: Create a new virtual machine or cluster of virtual machines
### Aliases: create_vm create_vm_cluster

### ** Examples

## Not run: 
##D 
##D sub <- AzureRMR::az_rm$
##D     new(tenant="myaadtenant.onmicrosoft.com", app="app_id", password="password")$
##D     get_subscription("subscription_id")
##D 
##D # default Windows Server DSVM: make sure to use a strong password!
##D sub$create_vm("myWindowsDSVM",
##D    location="australiaeast",
##D    username="ds",
##D    passkey="Password123!")
##D 
##D # upsized Linux (Ubuntu) DSVM
##D sub$create_vm("myLinuxDSVM",
##D    location="australiaeast",
##D    os="Linux",
##D    username="ds",
##D    passkey=readLines("~/id_rsa.pub"),
##D    size="Standard_DS13_v2")
##D 
##D sub$create_vm_cluster("myLinuxCluster",
##D    location="australiaeast",
##D    os="Linux",
##D    username="ds",
##D    passkey=readLines("~/id_rsa.pub"),
##D    clust_size=5)
##D 
## End(Not run)



