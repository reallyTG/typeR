library(basefun)


### Name: Legendre_basis
### Title: Legendre Basis Functions
### Aliases: Legendre_basis

### ** Examples


  ### set-up basis
  lb <- Legendre_basis(numeric_var("x", support = c(0, pi)), 
                       order = 3)

  ### generate data + coefficients
  x <- as.data.frame(mkgrid(lb, n = 100))
  cf <- c(1, 2, 2.5, 1.75)

  ### evaluate basis (in two equivalent ways)
  lb(x[1:10,,drop = FALSE])
  model.matrix(lb, data = x[1:10, ,drop = FALSE])

  ### evaluate and plot Legendre polynomial defined by
  ### basis and coefficients
  plot(x$x, predict(lb, newdata = x, coef = cf), type = "l")




