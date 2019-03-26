library(spatstat)


### Name: methods.dppm
### Title: Methods for Determinantal Point Process Models
### Aliases: methods.dppm coef.dppm formula.dppm print.dppm terms.dppm
###   labels.dppm
### Keywords: spatial methods

### ** Examples

  fit <- dppm(swedishpines ~ x + y, dppGauss())
  coef(fit)
  formula(fit)
  tf <- terms(fit)
  labels(fit)



