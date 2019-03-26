library(spatstat)


### Name: model.images
### Title: Compute Images of Constructed Covariates
### Aliases: model.images model.images.ppm model.images.dppm
###   model.images.kppm model.images.lppm model.images.slrm
### Keywords: spatial models

### ** Examples

   fit <- ppm(cells ~ x)
   model.images(fit)
   B <- owin(c(0.2, 0.4), c(0.3, 0.8))
   model.images(fit, B)
   fit2 <- ppm(cells ~ cut(x,3))
   model.images(fit2)
   fit3 <- slrm(japanesepines ~ x)
   model.images(fit3)
   fit4 <- ppm(amacrine ~ marks + x)
   model.images(fit4)



