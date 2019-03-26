library(spatstat)


### Name: default.rmhcontrol
### Title: Set Default Control Parameters for Metropolis-Hastings
###   Algorithm.
### Aliases: default.rmhcontrol
### Keywords: spatial datagen

### ** Examples

  fit <- ppm(cells, ~1, Strauss(0.1))
  default.rmhcontrol(fit)
  default.rmhcontrol(fit, w=square(2))



