library(intrinsicDimension)


### Name: M_rozza
### Title: Manifolds from Rozza et al. (2012)
### Aliases: m14Manifold m15Manifold
### Keywords: datagen

### ** Examples

datap <- m14Manifold(800)
par(mfrow = c(1, 3))
plot(datap[,1], datap[,3])
plot(datap[,2], datap[,3])
plot(datap[,1], datap[,2])
datap <- m15Manifold(800)
par(mfrow = c(1, 3))
plot(datap[,1], datap[,3])
plot(datap[,2], datap[,3])
plot(datap[,1], datap[,2])



