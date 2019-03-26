library(basefun)


### Name: predict.basis
### Title: Evaluate Basis Functions
### Aliases: predict.basis predict.cbind_bases predict.box_bases

### ** Examples


  ### set-up a Bernstein polynomial
  xv <- numeric_var("x", support = c(1, pi))
  bb <- Bernstein_basis(xv, order = 3, ui = "increasing")
  ## and treatment contrasts for a factor at three levels
  fb <- as.basis(~ g, data = factor_var("g", levels = LETTERS[1:3]))

  ### join them: we get one intercept and two deviation _functions_
  bfb <- b(bern = bb, f = fb)

  ### generate data + coefficients
  x <- mkgrid(bfb, n = 10)
  cf <- c(1, 2, 2.5, 2.6)
  cf <- c(cf, cf + 1, cf + 2)

  ### evaluate predictions for all combinations in x (a list!)
  predict(bfb, newdata = x, coef = cf)

  ## same but slower
  matrix(predict(bfb, newdata = expand.grid(x), coef = cf), ncol = 3)




