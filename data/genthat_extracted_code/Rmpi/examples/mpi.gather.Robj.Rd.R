library(Rmpi)


### Name: mpi.gather.Robj
### Title: Extentions of MPI\_Gather and MPI\_Allgather APIs
### Aliases: mpi.gather.Robj mpi.allgather.Robj
### Keywords: interface

### ** Examples

## No test: 
#Assume that there are some slaves running
mpi.bcast.cmd(id<-mpi.comm.rank())
mpi.bcast.cmd(x<-rnorm(id))
mpi.bcast.cmd(mpi.gather.Robj(x))
x<-"test mpi.gather.Robj"
mpi.gather.Robj(x)

mpi.bcast.cmd(obj<-rnorm(id+10))
mpi.bcast.cmd(nn<-mpi.allgather.Robj(obj))
obj<-rnorm(5)
mpi.allgather.Robj(obj)
mpi.remote.exec(nn)
## End(No test)



