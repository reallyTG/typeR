library(Rmpi)


### Name: mpi.scatter.Robj
### Title: Extensions of MPI\_ SCATTER and MPI\_SCATTERV
### Aliases: mpi.scatter.Robj mpi.scatter.Robj2slave
### Keywords: utilities

### ** Examples

## No test: 
#assume that there are three slaves running
mpi.bcast.cmd(x<-mpi.scatter.Robj())

xx <- list("master",rnorm(3),letters[2],1:10)
mpi.scatter.Robj(obj=xx)

mpi.remote.exec(x)

#scatter a matrix to slaves
dat=matrix(1:24,ncol=3)
splitmatrix = function(x, ncl) lapply(.splitIndices(nrow(x), ncl), function(i) x[i,])
dat2=splitmatrix(dat,3)
mpi.scatter.Robj2slave(dat2)
mpi.remote.exec(dat2)
## End(No test)



