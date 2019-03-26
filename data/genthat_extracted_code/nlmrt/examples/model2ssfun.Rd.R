library(nlmrt)


### Name: model2ssfun
### Title: Generate a sum of squares objective function from a nonlinear
###   model expression and a vector of named parameters.
### Aliases: model2ssfun
### Keywords: nonlinear least squares

### ** Examples

  # a test
  y <- c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 38.558, 
      50.156, 62.948, 75.995, 91.972)  # for testing
  tt <- seq_along(y)  # for testing
  f <- y ~ b1/(1 + b2 * exp(-1 * b3 * tt))
  p <- c(b1 = 1, b2 = 1, b3 = 1)
  myfn <- model2ssfun(f, p)
  cat("myfn: \n")
  print(myfn) # list the function
  cat("Compute the function at several points\n")
  ans <- myfn(p, tt = tt, y = y)
  print(ans) # should be  23520.58
  bnew <- c(b1 = 200, b2 = 50, b3 = 0.3)
  anew <- myfn(prm = bnew, tt = tt, y = y)
  print(anew)# should be  158.2324
  
  cat("Test with vector of un-named parameters \n")
  bthree <- c(100, 40, 0.1)
  athree <- try(myfn(prm = bthree, tt = tt, y = y))
  print(athree) # should be 19536.65



