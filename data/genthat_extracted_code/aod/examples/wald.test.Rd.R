library(aod)


### Name: wald.test
### Title: Wald Test for Model Coefficients
### Aliases: wald.test print.wald.test
### Keywords: htest

### ** Examples

  data(orob2)
  fm <- quasibin(cbind(y, n - y) ~ seed * root, data = orob2)
  # Wald test for the effect of root
  wald.test(b = coef(fm), Sigma = vcov(fm), Terms = 3:4)
  


