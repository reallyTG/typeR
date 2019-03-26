library(aod)


### Name: raoscott
### Title: Test of Proportion Homogeneity using Rao and Scott's Adjustment
### Aliases: raoscott show,raoscott-class
### Keywords: htest

### ** Examples

  data(rats)
  # deff by group
  raoscott(cbind(y, n - y) ~ group, data = rats)
  raoscott(y/n ~ group, weights = n, data = rats)
  raoscott(response = cbind(y, n - y), group = group, data = rats)
  raoscott(response = y/n, weights = n, group = group, data = rats)
  # pooled deff
  raoscott(cbind(y, n - y) ~ group, data = rats, pooled = TRUE)
  # standard test
  raoscott(cbind(y, n - y) ~ group, data = rats, deff = c(1, 1))
  data(antibio)
  raoscott(cbind(y, n - y) ~ treatment, data = antibio)
  


