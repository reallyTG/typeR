library(basefun)


### Name: Bernstein_basis
### Title: Bernstein Basis Functions
### Aliases: Bernstein_basis

### ** Examples


  ### set-up basis
  bb <- Bernstein_basis(numeric_var("x", support = c(0, pi)), 
                        order = 3, ui = "increasing")

  ### generate data + coefficients
  x <- as.data.frame(mkgrid(bb, n = 100))
  cf <- c(1, 2, 2.5, 2.6)

  ### evaluate basis (in two equivalent ways)
  bb(x[1:10,,drop = FALSE])
  model.matrix(bb, data = x[1:10, ,drop = FALSE])

  ### check constraints
  cnstr <- attr(bb(x[1:10,,drop = FALSE]), "constraint")
  all(cnstr$ui %*% cf > cnstr$ci)

  ### evaluate and plot Bernstein polynomial defined by
  ### basis and coefficients
  plot(x$x, predict(bb, newdata = x, coef = cf), type = "l")

  ### evaluate and plot first derivative of 
  ### Bernstein polynomial defined by basis and coefficients
  plot(x$x, predict(bb, newdata = x, coef = cf, deriv = c(x = 1)), 
       type = "l")




