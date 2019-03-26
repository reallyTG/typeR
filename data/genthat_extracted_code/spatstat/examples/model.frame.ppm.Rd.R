library(spatstat)


### Name: model.frame.ppm
### Title: Extract the Variables in a Point Process Model
### Aliases: model.frame.ppm model.frame.kppm model.frame.dppm
###   model.frame.lppm
### Keywords: spatial models

### ** Examples

  fit <- ppm(cells ~ x)
  mf <- model.frame(fit)
  kfit <- kppm(redwood ~ x, "Thomas")
  kmf <- model.frame(kfit)



