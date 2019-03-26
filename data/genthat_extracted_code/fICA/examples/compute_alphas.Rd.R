library(fICA)


### Name: compute_alphas
### Title: Estimation of Alphas in the Asymptotic Covariance Matrix of the
###   Deflation-based FastICA Estimator
### Aliases: compute_alphas
### Keywords: multivariate

### ** Examples

A <- matrix(rnorm(9),3,3)
s1 <- rt(1000,6)
s2 <- rexp(1000,1)
s3 <- runif(1000)

S <- cbind(s1,s2,s3)
X <- S %*% t(A)

Sest <- fICA(X,method="def")$S

compute_alphas(Sest, gs=gf[1:3], dgs=dgf[1:3], name=gnames[1:3])



