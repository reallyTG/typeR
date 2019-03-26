library(mkde)


### Name: computeAreaRaster
### Title: Calculate cell areas from elevation raster.
### Aliases: computeAreaRaster

### ** Examples

library(raster)
data(condordem)
cell.sz <- mean(res(condordem))
area.rast <- computeAreaRaster(as.matrix(condordem), cell.sz)



