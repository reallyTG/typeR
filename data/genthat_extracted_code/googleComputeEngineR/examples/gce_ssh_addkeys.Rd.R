library(googleComputeEngineR)


### Name: gce_ssh_addkeys
### Title: Add SSH details to a gce_instance
### Aliases: gce_ssh_addkeys

### ** Examples


## Not run: 
##D   
##D   library(googleComputeEngineR)
##D   
##D   vm <- gce_vm("my-instance")
##D   
##D   ## if you have already logged in via gcloud, the default keys will be used
##D   ## no need to run gce_ssh_addkeys
##D   ## run command on instance            
##D   gce_ssh(vm, "echo foo")
##D   
##D   
##D   ## if running on Windows, use the RStudio default SSH client
##D   ## e.g. add C:\Program Files\RStudio\bin\msys-ssh-1000-18 to your PATH
##D   ## then run: 
##D   vm2 <- gce_vm("my-instance2")
##D 
##D   ## add SSH info to the VM object
##D   ## custom info
##D   vm <- gce_ssh_setup(vm,
##D                       username = "mark", 
##D                       key.pub = "C://.ssh/id_rsa.pub",
##D                       key.private = "C://.ssh/id_rsa")
##D                       
##D   ## run command on instance            
##D   gce_ssh(vm, "echo foo")
##D   #> foo
##D 
##D   ## example to check logs of rstudio docker container
##D   gce_ssh(vm, "sudo journalctl -u rstudio")
##D 
## End(Not run)



