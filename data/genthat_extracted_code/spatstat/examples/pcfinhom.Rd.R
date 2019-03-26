library(spatstat)


### Name: pcfinhom
### Title: Inhomogeneous Pair Correlation Function
### Aliases: pcfinhom
### Keywords: spatial nonparametric

### ** Examples

  data(residualspaper)
  X <- residualspaper$Fig4b
  plot(pcfinhom(X, stoyan=0.2, sigma=0.1))
  fit <- ppm(X, ~polynom(x,y,2))
  plot(pcfinhom(X, lambda=fit, normpower=2))



