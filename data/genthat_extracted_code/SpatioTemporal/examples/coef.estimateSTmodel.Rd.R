library(SpatioTemporal)


### Name: coef.estimateSTmodel
### Title: Returns estimated parameters (and uncertaintes)
### Aliases: coef.estimateSTmodel

### ** Examples

  ##load data
  data(est.mesa.model)
  ##extract all parameters
  coef(est.mesa.model)
  ##extract only covariance parameters
  coef(est.mesa.model, pars="cov")




