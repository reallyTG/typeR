library(Rmpi)


### Name: mpi.send
### Title: MPI\_Send, MPI\_Isend, MPI\_Recv, and MPI\_Irecv APIs
### Aliases: mpi.send mpi.isend mpi.recv mpi.irecv
### Keywords: interface

### ** Examples
 
## No test: 
#on a slave
mpi.send(1:10,1,0,0)

#on master
x <- integer(10)
mpi.irecv(x,1,1,0)
x	
mpi.wait()
x
## End(No test)



