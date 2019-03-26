library(spatstat)


### Name: spatialcdf
### Title: Spatial Cumulative Distribution Function
### Aliases: spatialcdf
### Keywords: spatial nonparametric

### ** Examples

   with(bei.extra, {
     plot(spatialcdf(grad))
     fit <- ppm(bei ~ elev)
     plot(spatialcdf(grad, predict(fit)))
     plot(A <- spatialcdf(grad, fit))
     A(0.1)
  })
  plot(spatialcdf("x", W=letterR))



