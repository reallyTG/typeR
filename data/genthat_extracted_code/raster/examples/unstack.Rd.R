library(raster)


### Name: unstack
### Title: Unstack
### Aliases: unstack unstack,RasterStack-method unstack,RasterBrick-method
### Keywords: spatial methods

### ** Examples

  file <- system.file("external/test.grd", package="raster")
  s <- stack(file, file)
  list1 <- unstack(s)
  b <- brick(s)
  list2 <- unstack(b)



