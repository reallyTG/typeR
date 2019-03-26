library(raster)


### Name: datasource
### Title: Are values in memory and/or on disk?
### Aliases: fromDisk inMemory hasValues
### Keywords: spatial

### ** Examples

rs <- raster(system.file("external/test.grd", package="raster"))
inMemory(rs)
fromDisk(rs)
rs <- readAll(rs)
inMemory(rs)
fromDisk(rs)
rs <- rs + 1
inMemory(rs)
fromDisk(rs)
rs <- raster(rs)
inMemory(rs)
fromDisk(rs)
rs <- setValues(rs, 1:ncell(rs))
inMemory(rs)
fromDisk(rs)
rs <- writeRaster(rs, filename='test', overwrite=TRUE)
inMemory(rs)
fromDisk(rs)



