library(raster)


### Name: hdr
### Title: Header files
### Aliases: hdr
### Keywords: spatial

### ** Examples
 
r <- raster(system.file("external/test.grd", package="raster"))
r <- writeRaster(r, filename='export.grd', overwrite=TRUE)
hdr(r, format="ENVI") 



