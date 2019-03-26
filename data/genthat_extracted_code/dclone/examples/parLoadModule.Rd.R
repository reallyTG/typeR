library(dclone)


### Name: parLoadModule
### Title: Dynamically load JAGS modules on parallel workers
### Aliases: parLoadModule parUnloadModule parListModules
### Keywords: interface

### ** Examples

## Not run: 
##D if (require(rjags)) {
##D cl <- makePSOCKcluster(3)
##D parListModules(cl)
##D parLoadModule(cl, "glm")
##D parListModules(cl)
##D parUnloadModule(cl, "glm")
##D parListModules(cl)
##D stopCluster(cl)
##D }
## End(Not run)



