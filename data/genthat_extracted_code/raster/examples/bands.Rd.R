library(raster)


### Name: bands
### Title: Number of bands
### Aliases: bandnr bandnr,RasterLayer-method nbands
### Keywords: spatial

### ** Examples

f <- system.file("external/rlogo.grd", package="raster")
r <- raster(f, layer=2)
nbands(r)
bandnr(r)



