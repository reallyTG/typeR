library(poissonMT)


### Name: poissonMT
### Title: Robust Fitting of Poisson Generalized Linear Models using MT
###   robust method
### Aliases: poissonMT
### Keywords: robust regression nonlinear

### ** Examples

  data(epilepsy)
  x <- model.matrix( ~ Age10 + Base4*Trt, data=epilepsy)
  poissonMTsetwd(tempdir())  
  start <- poissonMTinitial(x=x, y=epilepsy$Ysum)$coefficients
  Efit3 <- poissonMT(x=x, y=epilepsy$Ysum, start=start)



