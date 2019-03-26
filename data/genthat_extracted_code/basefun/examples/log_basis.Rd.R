library(basefun)


### Name: log_basis
### Title: Logarithmic Basis Function
### Aliases: log_basis

### ** Examples


  ### set-up basis
  lb <- log_basis(numeric_var("x", support = c(0.1, pi)))

  ### generate data + coefficients
  x <- as.data.frame(mkgrid(lb, n = 100))

  ### 1 + 2 * log(x) 
  max(abs(predict(lb, newdata = x, coef = c(1, 2)) - (1 + 2 * log(x$x))))




