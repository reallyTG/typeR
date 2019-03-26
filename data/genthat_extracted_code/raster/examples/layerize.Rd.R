library(raster)


### Name: layerize
### Title: Layerize
### Aliases: layerize layerize,RasterLayer,missing-method
###   layerize,RasterLayer,RasterLayer-method
### Keywords: spatial

### ** Examples

r <- raster(nrow=36, ncol=72)
r[] <- round(runif(ncell(r))*5)
r[1:5] <- NA
b <- layerize(r)

r2 <- raster(nrow=10, ncol=10)
b2 <- layerize(r, r2)



