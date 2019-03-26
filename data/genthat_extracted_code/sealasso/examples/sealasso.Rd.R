library(sealasso)


### Name: sealasso
### Title: Standard Error Adjusted Adaptive Lasso
### Aliases: sealasso

### ** Examples

  # use the diabetes dataset from "lars" package
  data(diabetes)
  x <- diabetes$x
  y <- diabetes$y
  sealasso(x, y)

  # with quadratic terms
  x2 <- cbind(diabetes$x1,diabetes$x2)
  object <- sealasso(x2, y, "sealasso")
  object$condition.index
  object$optim.beta



