library(Rmpi)


### Name: mpi.applyLB
### Title: (Load balancing) parallel apply
### Aliases: mpi.applyLB mpi.parApply mpi.parLapply mpi.parSapply
###   mpi.parRapply mpi.parCapply mpi.parReplicate mpi.parMM
### Keywords: utilities

### ** Examples

## No test: 
#Assume that there are some slaves running

#mpi.applyLB
x=1:7
mpi.applyLB(x,rnorm,mean=2,sd=4)

#get the same simulation 
mpi.remote.exec(set.seed(111))
mpi.applyLB(x,rnorm,mean=2,sd=4)
mpi.remote.exec(set.seed(111))
mpi.applyLB(x,rnorm,mean=2,sd=4,apply.seq=.mpi.applyLB)

#mpi.parApply
x=1:24
dim(x)=c(2,3,4)
mpi.parApply(x, MARGIN=c(1,2), FUN=mean,job.num = 5)

#mpi.parLapply
mdat <- matrix(c(1,2,3, 7,8,9), nrow = 2, ncol=3, byrow=TRUE,
                    dimnames = list(c("R.1", "R.2"), c("C.1", "C.2", "C.3")))
mpi.parLapply(mdat, rnorm) 

#mpi.parSapply
mpi.parSapply(mdat, rnorm) 

#mpi.parMM
A=matrix(1:1000^2,ncol=1000)
mpi.parMM(A,A)
## End(No test)



