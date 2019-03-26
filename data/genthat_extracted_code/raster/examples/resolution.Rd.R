library(raster)


### Name: resolution
### Title: Resolution
### Aliases: xres yres res xres,BasicRaster-method yres,BasicRaster-method
###   res,BasicRaster-method res<-
### Keywords: spatial

### ** Examples

r <- raster(ncol=18, nrow=18)
xres(r)
yres(r)
res(r)

res(r) <- 1/120
# set yres differently
res(r) <- c(1/120, 1/60)





