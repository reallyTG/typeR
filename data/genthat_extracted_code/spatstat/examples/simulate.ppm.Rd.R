library(spatstat)


### Name: simulate.ppm
### Title: Simulate a Fitted Gibbs Point Process Model
### Aliases: simulate.ppm
### Keywords: spatial models

### ** Examples

  ## Don't show: 
op <- spatstat.options(rmh.nrep=10)
## End(Don't show)
  fit <- ppm(japanesepines, ~1, Strauss(0.1))
  simulate(fit, 2)
  simulate(fit, 2, singlerun=TRUE, nsave=1e4, nburn=1e4)
  ## Don't show: 
spatstat.options(op)
## End(Don't show)



