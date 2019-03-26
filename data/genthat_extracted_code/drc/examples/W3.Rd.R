library(drc)


### Name: W1.3
### Title: The three-parameter Weibull functions
### Aliases: W1.3 w3 W2.3 W2x.3 W1.3u W2.3u
### Keywords: models nonlinear

### ** Examples


## Fitting a three-parameter Weibull model
ryegrass.m1 <- drm(rootl ~ conc, data = ryegrass, fct = W1.3())
ryegrass.m1




