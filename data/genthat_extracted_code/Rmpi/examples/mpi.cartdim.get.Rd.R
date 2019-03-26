library(Rmpi)


### Name: mpi.cartdim.get
### Title: MPI\_Cartdim\_get
### Aliases: mpi.cartdim.get
### Keywords: interface

### ** Examples

## No test: 
#Need at least 9 slaves
mpi.bcast.cmd(mpi.cart.create(1,c(3,3),c(F,T)))
mpi.cart.create(1,c(3,3),c(F,T))
mpi.cartdim.get(comm=3)
## End(No test)



