library(EMMIXskew)


### Name: ddmvt
### Title: The Multivariate t-Distribution
### Aliases: ddmvt rdmvt
### Keywords: cluster datasets

### ** Examples

n <- 100
p <- 2

mean   <- rep(0,p)
cov    <- diag(p)
nu     <-  3

set.seed(3214)

x   <- rdmvt(    n,p,mean,cov,nu)

den <- ddmvt(x  ,n,p,mean,cov,nu)




