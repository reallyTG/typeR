library(spatstat)


### Name: rMosaicSet
### Title: Mosaic Random Set
### Aliases: rMosaicSet
### Keywords: spatial datagen

### ** Examples

   # Switzer's random set
   X <- rpoislinetess(3)
   plot(rMosaicSet(X, 0.5), col="green", border=NA)

   # another example
   plot(rMosaicSet(dirichlet(runifpoint(30)), 0.4))



