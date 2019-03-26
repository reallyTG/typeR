library(Rmpi)


### Name: mpi.spawn.Rslaves
### Title: Spawn and Close R Slaves
### Aliases: mpi.spawn.Rslaves mpi.close.Rslaves tailslave.log
### Keywords: utilities

### ** Examples

## No test: 
mpi.spawn.Rslaves(nslaves=2)
tailslave.log()
mpi.remote.exec(rnorm(10))
mpi.close.Rslaves()
## End(No test)



