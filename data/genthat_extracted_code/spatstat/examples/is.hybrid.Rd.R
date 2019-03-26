library(spatstat)


### Name: is.hybrid
### Title: Test Whether Object is a Hybrid
### Aliases: is.hybrid is.hybrid.ppm is.hybrid.interact
### Keywords: spatial models

### ** Examples

  S <- Strauss(0.1)
  is.hybrid(S)
  H <- Hybrid(Strauss(0.1), Geyer(0.2, 3))
  is.hybrid(H)

  data(redwood)
  fit <- ppm(redwood, ~1, H)
  is.hybrid(fit)



