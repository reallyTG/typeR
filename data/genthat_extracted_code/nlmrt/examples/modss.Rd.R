library(nlmrt)


### Name: modss
### Title: Compute gradient from residuals and Jacobian.
### Aliases: modss
### Keywords: nonlinear least squares

### ** Examples

  cat("See examples in nlmrt-package.Rd\n")
  y <- c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 38.558, 
      50.156, 62.948, 75.995, 91.972)  # for testing
  tt <- seq_along(y)  # for testing
  f <- y ~ b1/(1 + b2 * exp(-1 * b3 * tt))
  p <- c(b1 = 1, b2 = 1, b3 = 1)
  myres <- model2resfun(f, p)
  myssval <- modss(p, myres, tt = tt, y = y)
  cat("ss at (1,1,1) (should be 23520.58) = ",myssval,"\n")



