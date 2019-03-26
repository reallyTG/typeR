library(googleComputeEngineR)


### Name: gce_vm_template
### Title: Create a template container VM
### Aliases: gce_vm_template

### ** Examples


## Not run: 
##D 
##D  library(googleComputeEngineR)
##D  
##D  ## make instance using R-base
##D  vm <- gce_vm_template("r-base", predefined_type = "f1-micro", name = "rbase")
##D  
##D  ## run an R function on the instance within the R-base docker image
##D  docker_run(vm, "rocker/r-base", c("Rscript", "-e", "1+1"), user = "mark")
##D  #> [1] 2
##D  
##D 
## End(Not run)





