library(raster)


### Name: stack
### Title: Create a RasterStack object
### Aliases: stack stack,character-method stack,Raster-method
###   stack,list-method stack,missing-method
###   stack,SpatialPixelsDataFrame-method stack,SpatialGridDataFrame-method
###   stack,kasc-method
### Keywords: methods spatial

### ** Examples

# file with one layer
fn <- system.file("external/test.grd", package="raster")
s <- stack(fn, fn)
r <- raster(fn)
s <- stack(r, fn) 
nlayers(s)

# file with three layers
slogo <- stack(system.file("external/rlogo.grd", package="raster")) 
nlayers(slogo)
slogo



