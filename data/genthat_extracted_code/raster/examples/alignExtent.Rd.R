library(raster)


### Name: alignExtent
### Title: Align an extent (object of class Extent)
### Aliases: alignExtent
### Keywords: spatial

### ** Examples

r <- raster()
e <- extent(-10.1, 9.9, -20.1, 19.9)
ea <- alignExtent(e, r)
e
extent(r)
ea




