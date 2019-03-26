library(intrinsicDimension)


### Name: hyperCube
### Title: Hypercube
### Aliases: hyperCube hyperCubeFaces hyperCubeEdges
### Keywords: datagen

### ** Examples

datap <- hyperCubeEdges(200, 1, 3)
par(mfrow = c(1, 3))
plot(datap[, 1], datap[, 2])
plot(datap[, 1], datap[, 3])
plot(datap[, 2], datap[, 3])




