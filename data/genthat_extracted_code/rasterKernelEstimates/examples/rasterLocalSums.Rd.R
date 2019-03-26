library(rasterKernelEstimates)


### Name: rasterLocalSums
### Title: Local sums for an in memory raster image.
### Aliases: rasterLocalSums

### ** Examples

r <- raster::raster( matrix(rnorm(36),6,6)) 
W <- matrix(1,3,3)
sumR <- rasterLocalSums(r,W)



