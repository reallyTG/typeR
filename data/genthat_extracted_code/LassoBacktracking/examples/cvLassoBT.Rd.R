library(LassoBacktracking)


### Name: cvLassoBT
### Title: Cross-validation for 'LassoBT'
### Aliases: cvLassoBT

### ** Examples

x <- matrix(rnorm(100*250), 100, 250)
y <- x[, 1] + x[, 2] - x[, 1]*x[, 2] + x[, 3] + rnorm(100)
out <- cvLassoBT(x, y, iter_max=10, nperms=2)



