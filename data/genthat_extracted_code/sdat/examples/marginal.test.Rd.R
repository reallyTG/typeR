library(sdat)


### Name: marginal.test
### Title: Tests for signal detection via marginal approach
### Aliases: marginal.test

### ** Examples

n <- 100
p <- 10
x <- matrix(rnorm(n * p), n, p)
y <- 0.3 * x[, 1] + rnorm(n)
result <- marginal.test(x, y)
result[1 : 3]  # gives p-values of max-test, sum-test and adaptive-test
result[4]      # gives running time in seconds



