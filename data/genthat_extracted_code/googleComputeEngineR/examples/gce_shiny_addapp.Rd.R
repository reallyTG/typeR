library(googleComputeEngineR)


### Name: gce_shiny_addapp
### Title: Add Shiny app to a Shiny template instance
### Aliases: gce_shiny_addapp

### ** Examples

## Not run: 
##D 
##D vm <- gce_vm("shiny-test",  
##D              template = "shiny", 
##D              predefined_type = "n1-standard-1")
##D              
##D vm <- vm_ssh_setup(vm)
##D 
##D app_dir <- system.file("dockerfiles","shiny-googleAuthRdemo",
##D                        package = "googleComputeEngineR") 
##D                        
##D gce_shiny_addapp(vm, app_image = "gceshinydemo", dockerfolder = app_dir)
##D 
##D # a new VM, it loads the Shiny docker image from before
##D gce_shiny_addapp(vm2, app_image = "gceshinydemo")
##D 
## End(Not run)




