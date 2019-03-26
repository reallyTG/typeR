library(poissonMT)


### Name: poissonSSinitial
### Title: Initial Robust Estimates based on SubSampling method for fitting
###   of Poisson Generalized Linear Models
### Aliases: poissonSSinitial
### Keywords: robust regression nonlinear

### ** Examples

  data(epilepsy)
  x <- model.matrix( ~ Age10 + Base4*Trt, data=epilepsy)
  start <- poissonSSinitial(x=x, y=epilepsy$Ysum, nsubm=100)$coefficients
  start



