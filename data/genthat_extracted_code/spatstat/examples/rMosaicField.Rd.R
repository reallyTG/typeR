library(spatstat)


### Name: rMosaicField
### Title: Mosaic Random Field
### Aliases: rMosaicField
### Keywords: spatial datagen

### ** Examples

   X <- rpoislinetess(3)
   plot(rMosaicField(X, runif))
   plot(rMosaicField(X, runif, dimyx=256))
   plot(rMosaicField(X, rnorm, rgenargs=list(mean=10, sd=2)))

   plot(rMosaicField(dirichlet(runifpoint(30)), rnorm))



