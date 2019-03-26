library(aod)


### Name: residuals-methods
### Title: Residuals for Maximum-Likelihood and Quasi-Likelihood Models
### Aliases: residuals,glimML-method residuals,glimQL-method
### Keywords: regression

### ** Examples

  data(orob2)
  fm <- betabin(cbind(y, n - y) ~ seed, ~ 1,
                 link = "logit", data = orob2)
  #Pearson's chi-squared goodness-of-fit statistic
  sum(residuals(fm, type = "pearson")^2)
  


