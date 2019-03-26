library(nlmrt)


### Name: model2resfun
### Title: Generate a residual function from a nonlinear model expression
###   and a vector of named parameters.
### Aliases: model2resfun
### Keywords: nonlinear least squares

### ** Examples

  cat("See also examples in nlmrt-package.Rd\n")
    # a test
  y <- c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 38.558, 
      50.156, 62.948, 75.995, 91.972)  # for testing
  tt <- seq_along(y)  # for testing
  # NOTE: use of t gives confusion with t() in R CMD check,
  # but not in direct use with source() 120429
  f <- y ~ b1/(1 + b2 * exp(-1 * b3 * tt))
  p <- c(b1 = 1, b2 = 1, b3 = 1)
  myres <- model2resfun(f, p)
  cat("myres:\n")
  print(myres)
  ans <- myres(p, tt = tt, y = y)  
  cat("ans:")  
  print(ans)
  cat("ss ( =? 23520.58):", as.numeric(crossprod(ans)),"\n")
  bnew <- c(b1 = 200, b2 = 50, b3 = 0.3)
  # anew<-myres(prm=bnew, t=t, y=y) # Note issue with t vs
  # t()
  anew <- eval(myres(prm = bnew, tt = tt, y = y))
  cat("anew:")
  print(anew)
  cat("ss ( =? 158.2324):", as.numeric(crossprod(anew)),"\n")
  cat("Test with vector of un-named parameters\n")
  bthree <- c(100, 40, 0.1)
  athree <- try(myres(prm = bthree, tt = tt, y = y))
  print(athree)
  cat("ss ( =? 19536.65):", as.numeric(crossprod(athree)),"\n")



