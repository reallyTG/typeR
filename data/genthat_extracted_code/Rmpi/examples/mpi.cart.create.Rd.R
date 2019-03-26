library(Rmpi)


### Name: mpi.cart.create
### Title: MPI\_Cart\_create
### Aliases: mpi.cart.create
### Keywords: interface

### ** Examples

## No test: 
#Need at least 9 slaves
mpi.bcast.cmd(mpi.cart.create(1,c(3,3),c(F,T)))
mpi.cart.create(1,c(3,3),c(F,T))
## End(No test)



