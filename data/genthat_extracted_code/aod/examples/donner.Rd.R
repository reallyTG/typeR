library(aod)


### Name: donner
### Title: Test of Proportion Homogeneity using Donner's Adjustment
### Aliases: donner show,donner-class
### Keywords: htest

### ** Examples

  data(rats)
  donner(formula = cbind(y, n - y) ~ group, data = rats)
  donner(formula = y/n ~ group, weights = n, data = rats)
  donner(response = cbind(y, n - y), group = group, data = rats)
  donner(response = y/n, weights = n, group = group, data = rats)
  # standard test
  donner(cbind(y, n - y) ~ group, data = rats, C = c(1, 1))
  data(antibio)
  donner(cbind(y, n - y) ~ treatment, data = antibio)
  


