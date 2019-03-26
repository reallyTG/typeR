library(doMPI)


### Name: startMPIcluster
### Title: Create and start an MPI cluster
### Aliases: startMPIcluster
### Keywords: utilities

### ** Examples

## Not run: 
##D # start and register an MPI cluster with two workers in verbose mode:
##D cl <- startMPIcluster(count=2, verbose=TRUE)
##D registerDoMPI(cl)
##D # and shut it down
##D closeCluster(cl)
##D 
##D # set the working directory to /tmp:
##D cl <- startMPIcluster(count=2, workdir='/tmp')
##D registerDoMPI(cl)
##D # and shut it down
##D closeCluster(cl)
## End(Not run)



