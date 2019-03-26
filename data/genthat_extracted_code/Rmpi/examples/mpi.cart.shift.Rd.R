library(Rmpi)


### Name: mpi.cart.shift
### Title: MPI\_Cart\_shift
### Aliases: mpi.cart.shift
### Keywords: interface

### ** Examples

## No test: 
#Need at least 9 slaves
mpi.bcast.cmd(mpi.cart.create(1,c(3,3),c(F,T)))
mpi.cart.create(1,c(3,3),c(F,T))
mpi.remote.exec(mpi.cart.shift(3,2,1))#get neighbor ranks
mpi.remote.exec(mpi.cart.shift(3,1,1))
## End(No test)



