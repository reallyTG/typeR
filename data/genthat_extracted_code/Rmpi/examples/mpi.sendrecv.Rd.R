library(Rmpi)


### Name: mpi.sendrecv
### Title: MPI\_Sendrecv and MPI\_Sendrecv\_replace APIs
### Aliases: mpi.sendrecv mpi.sendrecv.replace
### Keywords: interface

### ** Examples

## No test: 
mpi.sendrecv(as.integer(11:20),1,0,33,integer(10),1,0,33,comm=0)
mpi.sendrecv.replace(seq(1,2,by=0.1),2,0,99,0,99,comm=0)
## End(No test) 



