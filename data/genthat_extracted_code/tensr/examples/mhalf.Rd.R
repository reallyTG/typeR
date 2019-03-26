library(tensr)


### Name: mhalf
### Title: The symmetric square root of a positive definite matrix.
### Aliases: mhalf

### ** Examples

Y <- matrix(stats::rnorm(4), nrow = 2)
M <- Y %*% t(Y)
X <- mhalf(M)
X
identical(M, X %*% X)



