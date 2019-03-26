library(ICtest)


### Name: FOBIboot
### Title: Boostrap-based Testing for the Number of Gaussian Components in
###   ICA Using FOBI
### Aliases: FOBIboot
### Keywords: htest multivariate

### ** Examples

n <- 1500
S <- cbind(runif(n), rchisq(n, 2), rexp(n), rnorm(n), rnorm(n), rnorm(n))
A <- matrix(rnorm(36), ncol = 6)
X <- S %*% t(A)

FOBIboot(X, k = 2)
FOBIboot(X, k = 3, s.boot = "B1")
FOBIboot(X, k = 0, s.boot = "B2")



