library(spatstat)


### Name: default.expand
### Title: Default Expansion Rule for Simulation of Model
### Aliases: default.expand
### Keywords: spatial datagen

### ** Examples

  data(cells)
  fit <- ppm(cells, ~1, Strauss(0.07))
  default.expand(fit)
  mod <- rmhmodel(cif="strauss", par=list(beta=100, gamma=0.5, r=0.07))
  default.expand(fit)



