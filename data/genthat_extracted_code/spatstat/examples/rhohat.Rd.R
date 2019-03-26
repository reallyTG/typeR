library(spatstat)


### Name: rhohat
### Title: Smoothing Estimate of Intensity as Function of a Covariate
### Aliases: rhohat rhohat.ppp rhohat.quad rhohat.ppm rhohat.lpp
###   rhohat.lppm
### Keywords: spatial models

### ** Examples

  X <-  rpoispp(function(x,y){exp(3+3*x)})
  rho <- rhohat(X, "x")
  rho <- rhohat(X, function(x,y){x})
  plot(rho)
  curve(exp(3+3*x), lty=3, col=2, add=TRUE)

  rhoB <- rhohat(X, "x", method="reweight")
  rhoC <- rhohat(X, "x", method="transform")

  ## Don't show: 
rh <- rhohat(X, "x", dimyx=32)
## End(Don't show)

  fit <- ppm(X, ~x)
  rr <- rhohat(fit, "y")

# linear network
  Y <- runiflpp(30, simplenet)
  rhoY <- rhohat(Y, "y")



