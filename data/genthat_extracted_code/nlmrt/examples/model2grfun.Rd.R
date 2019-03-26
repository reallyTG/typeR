library(nlmrt)


### Name: model2grfun
### Title: Generate a gradient function from a nonlinear model expression
###   and a vector of named parameters.
### Aliases: model2grfun
### Keywords: nonlinear least squares

### ** Examples

  cat("See also examples in nlmrt-package.Rd\n")
  require(numDeriv)
  y <- c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 38.558, 
      50.156, 62.948, 75.995, 91.972)  # for testing
  tt <- seq_along(y)  # for testing
  f <- y ~ b1/(1 + b2 * exp(-1 * b3 * tt))
  p <- c(b1 = 1, b2 = 1, b3 = 1)
  mygr <- model2grfun(f, p)
  myss <- model2ssfun(f, p) # for check
  cat("mygr:\n")
  print(mygr)
  
  ans <- mygr(p, tt = tt, y = y)
  print(ans)
  gnum <- grad(myss, p, tt = tt, y = y)
  cat("Max(abs(ans-gnum)) = ",max(abs(ans-gnum)),"\n")

  bnew <- c(b1 = 200, b2 = 50, b3 = 0.3)
  ans <- mygr(prm = bnew, tt = tt, y = y)
  print(ans)
  gnum <- grad(myss, bnew, tt = tt, y = y)
  cat("Max(abs(ans-gnum)) = ",max(abs(ans-gnum)),"\n")
  
  cat("Test with un-named vector\n")  # At 20120424 should fail
  bthree <- c(100, 40, 0.1)
  ans <- mygr(prm = bthree, tt = tt, y = y)
  print(ans)
  gnum <- grad(myss, bthree, tt = tt, y = y)
  cat("Max(abs(ans-gnum)) = ",max(abs(ans-gnum)),"\n")



