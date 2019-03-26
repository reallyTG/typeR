library(raster)


### Name: clump
### Title: Detect clumps
### Aliases: clump clump,RasterLayer-method
### Keywords: spatial

### ** Examples

r <- raster(ncols=12, nrows=12)
set.seed(0)
r[] <- round(runif(ncell(r))*0.7 )
rc <- clump(r) 
freq(rc)
plot(rc)



