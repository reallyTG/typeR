library(poissonMT)


### Name: glmrobMT
### Title: Robust Fitting of Poisson Generalized Linear Models using MT
###   robust method
### Aliases: glmrobMT
### Keywords: robust regression nonlinear

### ** Examples

  data(epilepsy)  
  Efit1 <- glm(Ysum ~ Age10 + Base4*Trt, family=poisson, data=epilepsy)

  x <- model.matrix( ~ Age10 + Base4*Trt, data=epilepsy)
  poissonMTsetwd(tempdir())   
  Efit2 <- glmrobMT(x=x, y=epilepsy$Ysum) 



