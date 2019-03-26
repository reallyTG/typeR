library(EasyABC)


### Name: binary_model
### Title: Wrapper for a binary executable for non-parallel simulations
### Aliases: binary_model
### Keywords: abc model inference

### ** Examples

 
 ## Not run: ##D 
##D     ## artificial example to show how to use the binary_model function with
##D     # an executable "My_Executable"
##D     ABC_rej<-ABC_rejection(model=binary_model("./My_Executable"), prior=..., n_cluster=1,...)
##D 
##D     # NB: on windows, "My_Executable" should be of the form "My_Executable.exe" :
##D     ABC_rej<-ABC_rejection(model=binary_model("./My_Executable.exe"), prior=..., n_cluster=1,...)
##D  
## End(Not run)



