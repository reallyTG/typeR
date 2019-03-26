library(raster)


### Name: sampleStratified
### Title: Stratified random sample
### Aliases: sampleStratified sampleStratified,RasterLayer-method
### Keywords: spatial

### ** Examples

 r <- raster(ncol=10, nrow=10)
 names(r) <- 'stratum'
 r[] <- round((runif(ncell(r))+0.5)*3)
 sampleStratified(r, size=3)



