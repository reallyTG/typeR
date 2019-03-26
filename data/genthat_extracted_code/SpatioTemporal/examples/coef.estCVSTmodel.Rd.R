library(SpatioTemporal)


### Name: coef.estCVSTmodel
### Title: Returns estimated parameters for each CV-group.
### Aliases: coef.estCVSTmodel

### ** Examples

  ##load data
  data(est.cv.mesa)
  ##extract all parameters
  coef(est.cv.mesa)
  ##extract only covariance parameters
  coef(est.cv.mesa, pars="cov")




