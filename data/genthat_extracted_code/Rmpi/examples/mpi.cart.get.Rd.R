library(Rmpi)


### Name: mpi.cart.get
### Title: MPI\_Cart\_get
### Aliases: mpi.cart.get
### Keywords: interface

### ** Examples

## No test: 
#Need at least 9 slaves
mpi.bcast.cmd(mpi.cart.create(1,c(3,3),c(F,T)))
mpi.cart.create(1,c(3,3),c(F,T))
mpi.remote.exec(mpi.cart.get(3,2))
## End(No test)



