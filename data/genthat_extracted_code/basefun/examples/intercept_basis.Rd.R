library(basefun)


### Name: intercept_basis
### Title: Intercept-Only Basis Function
### Aliases: intercept_basis

### ** Examples


  ### set-up basis
  ib <- intercept_basis()

  ### generate data + coefficients
  x <- as.data.frame(mkgrid(ib))

  ### 2 * 1 
  predict(ib, newdata = x, coef = 2)




