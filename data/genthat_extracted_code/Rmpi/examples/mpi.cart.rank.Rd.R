library(Rmpi)


### Name: mpi.cart.rank
### Title: MPI\_Cart\_rank
### Aliases: mpi.cart.rank
### Keywords: interface

### ** Examples

## No test: 
#Need at least 9 slaves
mpi.bcast.cmd(mpi.cart.create(1,c(3,3),c(F,T)))
mpi.cart.create(1,c(3,3),c(F,T))
mpi.cart.rank(3,c(1,0))
## End(No test)



