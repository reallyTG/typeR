library(Rmpi)


### Name: mpi.remote.exec
### Title: Remote Executions on R slaves
### Aliases: mpi.remote.exec
### Keywords: utilities

### ** Examples

## No test: 
mpi.remote.exec(mpi.comm.rank())
 x=5
mpi.remote.exec(rnorm,x)
## End(No test)



