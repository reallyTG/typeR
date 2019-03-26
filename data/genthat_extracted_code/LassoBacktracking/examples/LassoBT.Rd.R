library(LassoBacktracking)


### Name: LassoBT
### Title: Fit linear models with interactions using the Lasso.
### Aliases: LassoBT

### ** Examples

x <- matrix(rnorm(100*250), 100, 250)
y <- x[, 1] + x[, 2] - x[, 1]*x[, 2] + x[, 3] + rnorm(100)
out <- LassoBT(x, y, iter_max=10)



