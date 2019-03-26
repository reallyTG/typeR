library(ICtest)


### Name: PCAschott
### Title: Testing for Subsphericity using the Schott's test
### Aliases: PCAschott
### Keywords: htest multivariate

### ** Examples

n <- 200
X <- cbind(rnorm(n, sd = 2), rnorm(n, sd = 1.5), rnorm(n), rnorm(n), rnorm(n))
PCAschott(X, 2)



