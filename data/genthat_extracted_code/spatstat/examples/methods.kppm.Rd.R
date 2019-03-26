library(spatstat)


### Name: methods.kppm
### Title: Methods for Cluster Point Process Models
### Aliases: methods.kppm coef.kppm formula.kppm print.kppm terms.kppm
###   labels.kppm
### Keywords: spatial methods

### ** Examples

  data(redwood)
  fit <- kppm(redwood ~ x, "MatClust")
  coef(fit)
  formula(fit)
  tf <- terms(fit)
  labels(fit)



