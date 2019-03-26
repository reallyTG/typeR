library(mvnpermute)


### Name: mvnpermute
### Title: Generate Permutation-based Multivariate Normal Data
### Aliases: mvnpermute

### ** Examples

set.seed(98765)
N <- 100
r.mat <- matrix(rexp(N^2), ncol=N)
cv.mat <- crossprod(r.mat) # a positive definite covariance matrix
x.mat <- rep(1, N)
r.mean <- 3
r1 <- rnorm(N) # independent random noise
r.data <- x.mat * r.mean + drop( t(chol(cv.mat)) %*% r1 ) # correlated random noise
r.perm <- mvnpermute( r.data, x.mat, cv.mat, nr=1000, seed=1234)
est.cvm <- cov(t(r.perm))
plot(cv.mat, est.cvm); abline(0,1)



