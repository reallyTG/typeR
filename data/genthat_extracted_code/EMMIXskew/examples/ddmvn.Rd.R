library(EMMIXskew)


### Name: ddmvn
### Title: The Multivariate Normal Distribution
### Aliases: ddmvn rdmvn
### Keywords: cluster datasets

### ** Examples

n <- 100
p <- 2

mean <- rep(0,p)
cov  <- diag(p)

set.seed(3214)

y <-   rdmvn(  n,p,mean,cov)

den <- ddmvn(y,n,p,mean,cov)




