library(pcaPP)


### Name: ScaleAdv
### Title: centers and rescales data
### Aliases: ScaleAdv
### Keywords: multivariate

### ** Examples

  x <- rnorm(100, 10, 5)
  x <- ScaleAdv(x)$x

  # can be used with multivariate data too
  library(mvtnorm)
  x <- rmvnorm(100, 3:7, diag((7:3)^2))
  res <- ScaleAdv(x, center = l1median, scale = mad)
  res

  # instead of using an estimator, you could specify the center and scale yourself too
  x <- rmvnorm(100, 3:7, diag((7:3)^2))
  res <- ScaleAdv(x, 3:7, 7:3)
  res



