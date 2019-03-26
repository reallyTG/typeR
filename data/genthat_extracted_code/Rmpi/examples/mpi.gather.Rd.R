library(Rmpi)


### Name: mpi.gather
### Title: MPI\_Gather, MPI\_Gatherv, MPI\_Allgather, and MPI\_Allgatherv
###   APIs
### Aliases: mpi.gather mpi.gatherv mpi.allgather mpi.allgatherv
### Keywords: interface

### ** Examples

## No test: 
#Need 3 slaves to run properly
#Or use mpi.spawn.Rslaves(nslaves=3)
 mpi.bcast.cmd(id <-mpi.comm.rank(.comm), comm=1)
mpi.bcast.cmd(mpi.gather(letters[id],type=3,rdata=string(1)))
mpi.gather(letters[10],type=3,rdata=string(4))

 mpi.bcast.cmd(x<-rnorm(id))
 mpi.bcast.cmd(mpi.gatherv(x,type=2,rdata=double(1),rcounts=1))
 mpi.gatherv(double(1),type=2,rdata=double(sum(1:3)+1),rcounts=c(1,1:3))

mpi.bcast.cmd(out1<-mpi.allgatherv(x,type=2,rdata=double(sum(1:3)+1),
		rcounts=c(1,1:3)))
mpi.allgatherv(double(1),type=2,rdata=double(sum(1:3)+1),rcounts=c(1,1:3))
## End(No test)



