library(EasyABC)


### Name: binary_model_cluster
### Title: Wrapper for a binary executable for parallel simulations
### Aliases: binary_model_cluster
### Keywords: abc model inference

### ** Examples

 
 ## Not run: ##D 
##D     ## artificial example to show how to use the binary_model function with
##D     # an executable "My_Executable"
##D     ABC_rej<-ABC_rejection(model=binary_model_cluster("./My_Executable"),
##D       prior=..., n_cluster=2,...)
##D     # NB: on windows, "My_Executable" should be of the form "My_Executable.exe" :
##D     ABC_rej<-ABC_rejection(model=binary_model_cluster("./My_Executable.exe"),
##D       prior=..., n_cluster=2,...)
##D  
## End(Not run)



