library(Rmpi)


### Name: mpi.comm.size
### Title: MPI\_Comm\_c2f, MPI\_Comm\_dup, MPI\_Comm\_rank, and
###   MPI\_Comm\_size APIs
### Aliases: mpi.comm.c2f mpi.comm.dup mpi.comm.rank mpi.comm.size
### Keywords: interface

### ** Examples

## No test: 
#Assume that there are some slaves running
mpi.comm.size(comm=1)
mpi.comm.size(comm=0)

mpi.remote.exec(mpi.comm.rank(comm=1))
mpi.remote.exec(mpi.comm.rank(comm=0))

mpi.remote.exec(mpi.comm.size(comm=1))
mpi.remote.exec(mpi.comm.size(comm=0))

mpi.bcast.cmd(mpi.comm.dup(comm=1,newcomm=5))
mpi.comm.dup(comm=1,newcomm=5)
## End(No test)



