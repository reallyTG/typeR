library(spatstat)


### Name: default.dummy
### Title: Generate a Default Pattern of Dummy Points
### Aliases: default.dummy
### Keywords: spatial datagen

### ** Examples

  data(simdat)
  P <- simdat
  D <- default.dummy(P, 100)
  ## Not run: plot(D)
  Q <- quadscheme(P, D, "grid")
  ## Not run: plot(union.quad(Q))



