library(raster)


### Name: sampleRandom
### Title: Random sample
### Aliases: sampleRandom sampleRandom,Raster-method
### Keywords: spatial

### ** Examples

 r <- raster(system.file("external/test.grd", package="raster"))
 sampleRandom(r, size=10)
 s <- stack(r, r)
 sampleRandom(s, size=5, cells=TRUE, sp=TRUE)



