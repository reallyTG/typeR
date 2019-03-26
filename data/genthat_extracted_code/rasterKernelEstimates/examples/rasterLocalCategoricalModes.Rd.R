library(rasterKernelEstimates)


### Name: rasterLocalCategoricalModes
### Title: Local categorical modes for an in memory raster image
### Aliases: rasterLocalCategoricalModes

### ** Examples

r <- raster::raster( matrix(runif(81),9,9)) 
W <- matrix(1,3,3)
modeR <- rasterLocalCategoricalModes(r,W)



