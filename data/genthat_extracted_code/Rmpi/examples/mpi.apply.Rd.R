library(Rmpi)


### Name: mpi.apply
### Title: Scatter an array to slaves and then apply a FUN
### Aliases: mpi.apply mpi.iapply
### Keywords: utilities

### ** Examples

## No test: 
#Assume that there are at least 5 slaves running
#Otherwise run mpi.spawn.Rslaves(nslaves=5)
x=c(10,20)
mpi.apply(x,runif)
meanx=1:5
mpi.apply(meanx,rnorm,n=2,sd=4)
## End(No test)



