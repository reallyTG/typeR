library(basefun)


### Name: b
### Title: Box Product of Basis Functions
### Aliases: b

### ** Examples


  ### set-up a Bernstein polynomial
  xv <- numeric_var("x", support = c(1, pi))
  bb <- Bernstein_basis(xv, order = 3, ui = "increasing")
  ## and treatment contrasts for a factor at three levels
  fb <- as.basis(~ g, data = factor_var("g", levels = LETTERS[1:3]))
  
  ### join them: we get one intercept and two deviation _functions_
  bfb <- b(bern = bb, f = fb)

  ### generate data + coefficients
  x <- expand.grid(mkgrid(bfb, n = 10))
  cf <- c(1, 2, 2.5, 2.6)
  cf <- c(cf, cf + 1, cf + 2)

  ### evaluate bases
  model.matrix(bfb, data = x)

  ### plot functions
  plot(x$x, predict(bfb, newdata = x, coef = cf), type = "p",
       pch = (1:3)[x$g])
  legend("bottomright", pch = 1:3, 
         legend = colnames(model.matrix(fb, data = x)))




