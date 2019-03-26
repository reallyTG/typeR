library(rasterKernelEstimates)


### Name: rasterLocalMoments
### Title: Local moments for an in memory raster image
### Aliases: rasterLocalMoments

### ** Examples

r <- raster::raster( matrix(rnorm(36),6,6)) 
W <- matrix(1,3,3)
rLocalMoments <- rasterLocalMoments(r,W)



