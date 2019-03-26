library(condMVNorm)


### Name: condMVN
### Title: Conditional Mean and Variance of Multivariate Normal
###   Distribution
### Aliases: condMVN
### Keywords: distribution multivariate

### ** Examples

# 10-dimensional multivariate normal distribution
n <- 10
A <- matrix(rnorm(n^2), n, n)
A <- A %*% t(A)

condMVN(mean=rep(1,n), sigma=A, dependent=c(2,3,5), given=c(1,4,7,9),X.given=c(1,1,0,-1))

condMVN(mean=rep(1,n), sigma=A, dep=3, given=c(1,4,7,9), X=c(1,1,0,-1))



