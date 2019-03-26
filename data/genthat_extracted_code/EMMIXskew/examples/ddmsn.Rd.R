library(EMMIXskew)


### Name: ddmsn
### Title: The Multivariate Skew Normal Distribution
### Aliases: ddmsn rdmsn
### Keywords: cluster datasets

### ** Examples


n <- 100
p <- 2

mean <- rep(0,p)
cov  <- diag(p)
del<- c(0,1)

set.seed(3214)

y   <- rdmsn(  n,p,mean,cov,del)

den <- ddmsn(y,n,p,mean,cov,del)




