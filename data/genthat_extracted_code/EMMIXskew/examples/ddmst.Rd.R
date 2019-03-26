library(EMMIXskew)


### Name: ddmst
### Title: The Multivariate Skew t-distribution
### Aliases: ddmst rdmst
### Keywords: cluster datasets

### ** Examples


n <- 100
p <- 2

mean <- rep(0,p)
cov  <- diag(p)
nu <- 3
del <- c(0,1)

set.seed(3214)

y   <- rdmst(  n,p,mean,cov,nu,del)

den <- ddmst(y,n,p,mean,cov,nu,del)




