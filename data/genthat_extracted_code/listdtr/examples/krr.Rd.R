library(listdtr)


### Name: krr
### Title: Kernel Ridge Regression
### Aliases: krr
### Keywords: models regression

### ** Examples

  x <- matrix(rnorm(200 * 10), 200, 10)
  y <- x[, 1] + x[, 2] ^ 2 + x[, 3] * x[, 4] + rnorm(200)
  obj <- krr(x, y)
  
  xnew <- matrix(rnorm(1000 * 10), 1000, 10)
  ynew <- predict(obj, xnew)

  ytrue <- xnew[, 1] + xnew[, 2] ^ 2 + xnew[, 3] * xnew[, 4]
  mean((ynew - ytrue) ^ 2)  # MSE



