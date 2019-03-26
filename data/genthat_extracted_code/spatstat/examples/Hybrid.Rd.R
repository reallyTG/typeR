library(spatstat)


### Name: Hybrid
### Title: Hybrid Interaction Point Process Model
### Aliases: Hybrid
### Keywords: spatial models

### ** Examples

  Hybrid(Strauss(0.1), Geyer(0.2, 3))

  Hybrid(Ha=Hardcore(0.05), St=Strauss(0.1), Ge=Geyer(0.2, 3))

  fit <- ppm(redwood, ~1, Hybrid(A=Strauss(0.02), B=Geyer(0.1, 2)))
  fit

  ctr <- rmhcontrol(nrep=5e4, expand=1)
  plot(simulate(fit, control=ctr))

  # hybrid components can be models (including hybrid models)
  Hybrid(fit, S=Softcore(0.5))

  # plot.fii only works if every component is a pairwise interaction
  data(swedishpines)
  fit2 <- ppm(swedishpines, ~1, Hybrid(DG=DiggleGratton(2,10), S=Strauss(5)))
  plot(fitin(fit2))
  plot(fitin(fit2), separate=TRUE, mar.panel=rep(4,4))



