library(onlinePCA)


### Name: updateCovariance
### Title: Update the Sample Covariance Matrix
### Aliases: updateCovariance

### ** Examples

n <- 1e4
n0 <- 5e3
d <- 10
x <- matrix(runif(n*d), n, d)

## Direct computation of the covariance
C <- cov(x)

## Recursive computation of the covariance
xbar0 <- colMeans(x[1:n0,])
C0 <- cov(x[1:n0,])
Crec <- updateCovariance(C0, x[(n0+1):n,], n0, xbar0)

## Check equality
all.equal(C, Crec)



