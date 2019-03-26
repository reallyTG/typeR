library(intrinsicDimension)


### Name: mHeinManifold
### Title: 12-dimensional manifold from Hein and Audibert (2005)
### Aliases: mHeinManifold
### Keywords: datagen

### ** Examples

datap <- mHeinManifold(800)
par(mfrow = c(1, 3))
plot(datap[,1], datap[,3])
plot(datap[,2], datap[,3])
plot(datap[,1], datap[,2])



