library(spatstat)


### Name: methods.rhohat
### Title: Methods for Intensity Functions of Spatial Covariate
### Aliases: methods.rhohat print.rhohat plot.rhohat predict.rhohat
###   simulate.rhohat
### Keywords: spatial methods

### ** Examples

  X <-  rpoispp(function(x,y){exp(3+3*x)})
  rho <- rhohat(X, function(x,y){x})
  rho
  plot(rho)
  Y <- predict(rho)
  plot(Y)
  plot(simulate(rho), add=TRUE)
  # 
  fit <- ppm(X, ~x)
  rho <- rhohat(fit, "y")
  opa <- par(mfrow=c(1,2))
  plot(predict(rho))
  plot(predict(rho, relative=TRUE))
  par(opa)
  plot(predict(rho, what="se"))



