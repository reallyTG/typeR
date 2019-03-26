library(ICS)


### Name: cov4.wt
### Title: Weighted Scatter Matrix based on Fourth Moments
### Aliases: cov4.wt
### Keywords: multivariate

### ** Examples

cov.matrix.1 <- matrix(c(3,2,1,2,4,-0.5,1,-0.5,2), ncol=3)
X.1 <- rmvnorm(100, c(0,0,0), cov.matrix.1)
cov.matrix.2 <- diag(1,3)
X.2 <- rmvnorm(50, c(1,1,1), cov.matrix.2)
X <- rbind(X.1, X.2)

cov4.wt(X, rep(c(0,1), c(100,50)))
cov4.wt(X, rep(c(1,0), c(100,50)))



