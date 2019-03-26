library(LassoBacktracking)


### Name: predict.BT
### Title: Make predictions from a "'BT'" object.
### Aliases: coef.BT predict.BT

### ** Examples

x <- matrix(rnorm(100*250), 100, 250)
y <- x[, 1] + x[, 2] - x[, 1]*x[, 2] + x[, 3] + rnorm(100)
out <- LassoBT(x, y, iter_max=10)
predict(out, newx=x[1:2, ])



