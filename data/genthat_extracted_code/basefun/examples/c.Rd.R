library(basefun)


### Name: c.basis
### Title: Join Basis Functions
### Aliases: c.basis

### ** Examples


  ### set-up Bernstein and log basis functions
  xv <- numeric_var("x", support = c(1, pi))
  bb <- Bernstein_basis(xv, order = 3, ui = "increasing")
  lb <- log_basis(xv, remove_intercept = TRUE)
  
  ### join them
  blb <- c(bern = bb, log = lb)

  ### generate data + coefficients
  x <- as.data.frame(mkgrid(blb, n = 100))
  cf <- c(1, 2, 2.5, 2.6, 2)

  ### evaluate bases
  model.matrix(blb, data = x[1:10, ,drop = FALSE])

  ### evaluate and plot function defined by
  ### bases and coefficients
  plot(x$x, predict(blb, newdata = x, coef = cf), type = "l")

  ### evaluate and plot first derivative of function
  ### defined by bases and coefficients
  plot(x$x, predict(blb, newdata = x, coef = cf, deriv = c(x = 1)), 
       type = "l")




