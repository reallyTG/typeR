library(raster)


### Name: Extreme coordinates
### Title: Coordinates of the Extent of a Raster object
### Aliases: xmin xmax ymin ymax xmin<- xmax<- ymin<- ymax<-
###   xmin,BasicRaster-method xmax,BasicRaster-method
###   ymin,BasicRaster-method ymax,BasicRaster-method xmin,Extent-method
###   xmax,Extent-method ymin,Extent-method ymax,Extent-method
###   xmin,Spatial-method xmax,Spatial-method ymin,Spatial-method
###   ymax,Spatial-method
### Keywords: spatial

### ** Examples


r <- raster(xmn=-0.5, xmx = 9.5, ncols=10)
xmin(r)
xmax(r)
ymin(r)
ymax(r)
xmin(r) <- -180
xmax(r) <- 180



