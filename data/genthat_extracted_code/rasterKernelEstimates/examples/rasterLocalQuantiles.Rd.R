library(rasterKernelEstimates)


### Name: rasterLocalQuantiles
### Title: Local quantiles for an in memory raster image
### Aliases: rasterLocalQuantiles

### ** Examples

r <- raster::raster( matrix(rnorm(36),6,6)) 
W <- matrix(1,3,3)
medianR <- rasterLocalQuantiles(r,W)



