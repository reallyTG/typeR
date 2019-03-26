library(intrinsicDimension)


### Name: addNoise
### Title: Add Noise to Data Set
### Aliases: addNoise

### ** Examples

datap <- hyperCubeEdges(100, 1, 2)
datap <- addNoise(datap, 3, .05)
par(mfrow = c(1, 2))
plot(datap[, 1], datap[, 2])
plot(datap[, 1], datap[, 3])



