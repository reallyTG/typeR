library(spatstat)


### Name: model.matrix.ppm
### Title: Extract Design Matrix from Point Process Model
### Aliases: model.matrix.ppm model.matrix.kppm model.matrix.dppm
###   model.matrix.lppm model.matrix.ippm
### Keywords: spatial models

### ** Examples

   fit <- ppm(cells ~ x)
   head(model.matrix(fit))
   model.matrix(fit, Q=runifpoint(5))
   kfit <- kppm(redwood ~ x, "Thomas")
   m <- model.matrix(kfit)



