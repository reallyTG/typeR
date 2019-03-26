library(rasterList)


### Name: is.RasterList
### Title: Is a 'RasterList-class' object ?
### Aliases: is.RasterList

### ** Examples


r <- rasterList()
is.RasterList(r)
rr <- raster()
is.RasterList(rr)

f <- system.file("external/test.grd", package="raster")
ra <- rasterList(f)
is.RasterList(rr)






