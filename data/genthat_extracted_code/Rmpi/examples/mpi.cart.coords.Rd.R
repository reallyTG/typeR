library(Rmpi)


### Name: mpi.cart.coords
### Title: MPI\_Cart\_coords
### Aliases: mpi.cart.coords
### Keywords: interface

### ** Examples

## No test: 
#Need at least 9 slaves
mpi.bcast.cmd(mpi.cart.create(1,c(3,3),c(F,T)))
mpi.cart.create(1,c(3,3),c(F,T))
mpi.cart.coords(3,4,2)
## End(No test)




