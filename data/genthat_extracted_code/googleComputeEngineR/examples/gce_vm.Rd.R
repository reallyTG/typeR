library(googleComputeEngineR)


### Name: gce_vm
### Title: Create or fetch a virtual machine
### Aliases: gce_vm

### ** Examples


## Not run: 
##D 
##D library(googleComputeEngineR)
##D ## auto auth, project and zone pre-set
##D ## list your VMs in the project/zone
##D 
##D the_list <- gce_list_instances()
##D 
##D ## start an existing instance
##D vm <- gce_vm("markdev")
##D 
##D ## for rstudio, you also need to specify a username and password to login
##D vm <- gce_vm(template = "rstudio",
##D              name = "rstudio-server",
##D              username = "mark", password = "mark1234")
##D 
##D ## specify your own cloud-init file and pass it into gce_vm_container()
##D vm <- gce_vm(cloud_init = "example.yml",
##D              name = "test-container",
##D              predefined_type = "f1-micro")
##D 
##D ## specify disk size at creation
##D vm <- gce_vm('my-image3', disk_size_gb = 20)
##D 
##D 
## End(Not run)




