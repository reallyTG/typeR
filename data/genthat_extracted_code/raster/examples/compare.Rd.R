library(raster)


### Name: compareRaster
### Title: Compare Raster objects
### Aliases: compareRaster all.equal,Raster,Raster-method
### Keywords: spatial

### ** Examples

r1 <- raster()
r2 <- r1
r3 <- r1
compareRaster(r1, r2, r3)
nrow(r3) <- 10

# compareRaster(r1, r3)
compareRaster(r1, r3, stopiffalse=FALSE)
compareRaster(r1, r3, rowcol=FALSE)

all.equal(r1, r2)
all.equal(r1, r3)



