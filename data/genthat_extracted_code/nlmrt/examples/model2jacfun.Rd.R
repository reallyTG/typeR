library(nlmrt)


### Name: model2jacfun
### Title: Generate a Jacobian matrix function from a nonlinear model
###   expression and a vector of named parameters.
### Aliases: model2jacfun
### Keywords: nonlinear least squares

### ** Examples

  cat("See also examples in nlmrt-package.Rd\n")
  require(numDeriv)
  y <- c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 38.558, 
      50.156, 62.948, 75.995, 91.972)  # for testing
  tt <- seq_along(y)  # for testing
  f <- y ~ b1/(1 + b2 * exp(-1 * b3 * tt))
  p <- c(b1 = 1, b2 = 1, b3 = 1)
  myfn <- model2jacfun(f, p)
  myres <- model2resfun(f, p)
  cat("myfn:\n")
  print(myfn)
  
  ans <- myfn(p, tt = tt, y = y)
  print(ans)
  Jnum<-jacobian(myres, p,  tt = tt, y = y)
  cat("max(abs(ans-Jnum)) = ",max(abs(ans-Jnum)),"\n")

  bnew <- c(b1 = 200, b2 = 50, b3 = 0.3)
  ans <- myfn(prm = bnew, tt = tt, y = y)
  print(ans)
  Jnum<-jacobian(myres, bnew,  tt = tt, y = y)
  cat("max(abs(ans-Jnum)) = ",max(abs(ans-Jnum)),"\n")
  
  cat("Test with un-named vector\n")  # At 20120424 should fail
  bthree <- c(100, 40, 0.1)
  ans <- try(myfn(prm = bthree, tt = tt, y = y))
  print(ans)
  Jnum<-jacobian(myres, bthree,  tt = tt, y = y)
  cat("max(abs(ans-Jnum)) = ",max(abs(ans-Jnum)),"\n")



