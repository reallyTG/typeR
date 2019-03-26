library(mnormt)


### Name: pd.solve
### Title: Inverse of a symmetric positive-definite matrix
### Aliases: pd.solve
### Keywords: algebra array

### ** Examples

  x <- toeplitz(rev(1:4))
  x.inv <- pd.solve(x)
  print(x.inv %*% x)
  x.inv <- pd.solve(x, log.det=TRUE)
  logDet <- attr(x.inv, "log.det")
  print(abs(logDet - determinant(x, logarithm=TRUE)$modulus))



