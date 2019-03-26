library(poissonMT)


### Name: poissonL2T
### Title: Fitting of Poisson Generalized Linear Models using MT method
###   with L2 rho function
### Aliases: poissonL2T
### Keywords: regression nonlinear

### ** Examples

  data(epilepsy)
  x <- model.matrix( ~ Age10 + Base4*Trt, data=epilepsy)
  poissonMTsetwd(tempdir())
  Efit4 <- poissonL2T(x=x, y=epilepsy$Ysum)



