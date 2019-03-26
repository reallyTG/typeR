library(NPCirc)


### Name: dwsn
### Title: Wrapped skew-Normal density function
### Aliases: dwsn rwsn
### Keywords: circular density

### ** Examples

set.seed(2012)
# Density function of a wrapped skew-normal distribution WSN(pi,1,20)
wsn <- function(x) dwsn(x, xi=circular(pi), eta=1, lambda=20)
curve.circular(wsn,n=500,xlim=c(-1.65,1.65),main=expression(WSN(pi,1,20)))
# Random generation
data<-rwsn(50,xi=circular(pi),eta=1,lambda=20)
points(data)



