library(spatstat)


### Name: rmhmodel.ppm
### Title: Interpret Fitted Model for Metropolis-Hastings Simulation.
### Aliases: rmhmodel.ppm
### Keywords: spatial datagen

### ** Examples

  fit1 <- ppm(cells ~1, Strauss(0.07))
  mod1 <- rmhmodel(fit1)

  fit2 <- ppm(cells ~x, Geyer(0.07, 2))
  mod2 <- rmhmodel(fit2)

  fit3 <- ppm(cells ~x, Hardcore(0.07))
  mod3 <- rmhmodel(fit3)

  # Then rmh(mod1), etc



