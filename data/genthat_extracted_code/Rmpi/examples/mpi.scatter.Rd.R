library(Rmpi)


### Name: mpi.scatter
### Title: MPI\_Scatter and MPI\_Scatterv APIs
### Aliases: mpi.scatter mpi.scatterv
### Keywords: interface

### ** Examples

## No test: 
#Need 3 slaves to run properly
#Or run  mpi.spawn.Rslaves(nslaves=3)
  num="123456789abcd"
  scounts<-c(2,3,1,7)
  mpi.bcast.cmd(strnum<-mpi.scatter(integer(1),type=1,rdata=integer(1),root=0))
  strnum<-mpi.scatter(scounts,type=1,rdata=integer(1),root=0)
  mpi.bcast.cmd(ans <- mpi.scatterv(string(1),scounts=0,type=3,rdata=string(strnum),
					root=0))
  mpi.scatterv(as.character(num),scounts=scounts,type=3,rdata=string(strnum),root=0)
  mpi.remote.exec(ans)
## End(No test)



