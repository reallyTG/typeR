library(rwc)


### Name: cov.from.dist
### Title: Create covariance matrix from a distance matrix
### Aliases: cov.from.dist
### Keywords: ~kwd1 ~kwd2

### ** Examples

## create a Wishart covariance matrix with independent structure
Z=matrix(rnorm(10*20),ncol=20,nrow=10)
W=Z%*%t(Z)

## convert to resistance distance matrix
D=dist.from.cov(W)

## convert back to covariance matrix
C=cov.from.dist(D)

## compare C and W
max(abs(C-W))



