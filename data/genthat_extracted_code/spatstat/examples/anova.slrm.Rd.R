library(spatstat)


### Name: anova.slrm
### Title: Analysis of Deviance for Spatial Logistic Regression Models
### Aliases: anova.slrm
### Keywords: spatial models methods

### ** Examples

  X <- rpoispp(42)
  fit0 <- slrm(X ~ 1)
  fit1 <- slrm(X ~ x+y)
  anova(fit0, fit1, test="Chi")



