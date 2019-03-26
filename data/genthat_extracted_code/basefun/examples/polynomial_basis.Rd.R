library(basefun)


### Name: polynomial_basis
### Title: Polynomial Basis Functions
### Aliases: polynomial_basis

### ** Examples


  ### set-up basis of order 3 ommiting the quadratic term
  pb <- polynomial_basis(numeric_var("x", support = c(0, pi)), 
                         coef = c(TRUE, TRUE, FALSE, TRUE))

  ### generate data + coefficients
  x <- as.data.frame(mkgrid(pb, n = 100))
  cf <- c(1, 2, 0, 1.75)

  ### evaluate basis (in two equivalent ways)
  pb(x[1:10,,drop = FALSE])
  model.matrix(pb, data = x[1:10, ,drop = FALSE])

  ### evaluate and plot polynomial defined by
  ### basis and coefficients
  plot(x$x, predict(pb, newdata = x, coef = cf), type = "l")




