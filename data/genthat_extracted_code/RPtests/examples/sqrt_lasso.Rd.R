library(RPtests)


### Name: sqrt_lasso
### Title: Square-root Lasso regression
### Aliases: sqrt_lasso

### ** Examples

x <- matrix(rnorm(100*250), 100, 250)
y <- x[, 1] + x[, 2] + rnorm(100)
out <- sqrt_lasso(x, y)



