library(covequal)


### Name: test_covequal
### Title: Test for equality of covariance matrices
### Aliases: test_covequal

### ** Examples

X <- matrix(rnorm(50*100), ncol = 100)
Y <- matrix(rnorm(40*100), ncol = 100)
test_covequal(X, Y, inference = "TW", nperm = 10)



