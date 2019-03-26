library(ICtest)


### Name: FOBIasymp
### Title: Testing for the Number of Gaussian Components in NGCA or ICA
###   Using FOBI
### Aliases: FOBIasymp
### Keywords: htest multivariate

### ** Examples

n <- 1500
S <- cbind(runif(n), rchisq(n, 2), rexp(n), rnorm(n), rnorm(n), rnorm(n))
A <- matrix(rnorm(36), ncol = 6)
X <- S %*% t(A)

FOBIasymp(X, k = 2)
FOBIasymp(X, k = 3, type = "S1")
FOBIasymp(X, k = 0, type = "S2", model = "ICA")



