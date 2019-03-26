library(raster)


### Name: ncell
### Title: Number or rows, columns, and cells of a Raster* object
### Aliases: ncol nrow nrow,BasicRaster-method ncol,BasicRaster-method
###   ncell ncell,ANY-method ncell,BasicRaster-method
###   length,BasicRaster-method nrow<- ncol<-
###   nrow<-,BasicRaster,numeric-method ncol<-,BasicRaster,numeric-method
### Keywords: spatial

### ** Examples

r <- raster()
ncell(r)
ncol(r)
nrow(r)
dim(r)

nrow(r) <- 18
ncol(r) <- 36
# equivalent to
dim(r) <- c(18, 36) 



