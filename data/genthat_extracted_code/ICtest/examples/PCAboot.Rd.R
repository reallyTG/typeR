library(ICtest)


### Name: PCAboot
### Title: Bootstrap-Based Testing for Subsphericity
### Aliases: PCAboot
### Keywords: htest multivariate

### ** Examples

n <- 200
X <- cbind(rnorm(n, sd = 2), rnorm(n, sd = 1.5), rnorm(n), rnorm(n), rnorm(n))

TestCov <- PCAboot(X, k = 2)
TestCov

# for demonstration purpose the n.boot is chosen small, should be larger in real applications
TestTM <- PCAboot(X, k = 1, n.boot=80, s.boot = "B2", S = "tM", Sargs = list(df=2))
TestTM




