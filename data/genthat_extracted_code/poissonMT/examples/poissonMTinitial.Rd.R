library(poissonMT)


### Name: poissonMTinitial
### Title: Initial Robust Estimates based on MT robust method for fitting
###   of Poisson Generalized Linear Models
### Aliases: poissonMTinitial
### Keywords: robust regression nonlinear

### ** Examples

  data(epilepsy)
  x <- model.matrix( ~ Age10 + Base4*Trt, data=epilepsy)
  poissonMTsetwd(tempdir())
  start <- poissonMTinitial(x=x, y=epilepsy$Ysum)$coefficients
  start



