library(spatstat)


### Name: is.stationary
### Title: Recognise Stationary and Poisson Point Process Models
### Aliases: is.stationary is.stationary.ppm is.stationary.kppm
###   is.stationary.lppm is.stationary.slrm is.stationary.rmhmodel
###   is.stationary.dppm is.stationary.detpointprocfamily is.poisson
###   is.poisson.ppm is.poisson.kppm is.poisson.lppm is.poisson.slrm
###   is.poisson.rmhmodel is.poisson.interact
### Keywords: spatial models

### ** Examples

  data(cells)
  data(redwood)

  fit <- ppm(cells ~ x)
  is.stationary(fit)
  is.poisson(fit)

  fut <- kppm(redwood ~ 1, "MatClust")
  is.stationary(fut)
  is.poisson(fut)

  fot <- slrm(cells ~ x)
  is.stationary(fot)
  is.poisson(fot)



