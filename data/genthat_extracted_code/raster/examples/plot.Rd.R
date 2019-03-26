library(raster)


### Name: plot
### Title: Plot a Raster* object
### Aliases: plot plot,Raster,ANY-method plot,Raster,Raster-method
###   plot,Extent,missing-method lines,RasterLayer-method
### Keywords: methods spatial

### ** Examples
 
# RasterLayer
r <- raster(nrows=10, ncols=10)
r <- setValues(r, 1:ncell(r))
plot(r)

e <- extent(r)
plot(e, add=TRUE, col='red', lwd=4)
e <- e / 2
plot(e, add=TRUE, col='red')


# Scatterplot of 2 RasterLayers
r2 <- sqrt(r)
plot(r, r2)
plot(r, r2, gridded=TRUE)

# Multi-layer object (RasterStack / Brick)
s <- stack(r, r2, r/r)
plot(s, 2)
plot(s)

# two objects, different range, one scale:
r[] <- runif(ncell(r))
r2 <- r/2
brks <- seq(0, 1, by=0.1) 
nb <- length(brks)-1 
cols <- rev(terrain.colors(nb))
par(mfrow=c(1,2))
plot(r, breaks=brks, col=cols, lab.breaks=brks, zlim=c(0,1), main='first') 
plot(r2, breaks=brks, col=cols, lab.breaks=brks, zlim=c(0,1), main='second') 


# breaks and labels
x <- raster(nc=10, nr=10)
x[] <- runif(ncell(x))
brk <- c(0, 0.25, 0.75, 1)
arg <- list(at=c(0.12,0.5,0.87), labels=c("Low","Med.","High"))
plot(x, col=terrain.colors(3), breaks=brk)
plot(x, col=terrain.colors(3), breaks=brk, axis.args=arg)
par(mfrow=c(1,1))

# color ramp
plot(x, col=colorRampPalette(c("red", "white", "blue"))(255))

# adding random points to the map
xy <- cbind(-180 + runif(10) * 360, -90 + runif(10) * 180)
points(xy, pch=3, cex=5)

# for SpatialPolygons do
# plot(pols, add=TRUE)

# adding the same points to each map of each layer of a RasterStack
fun <- function() {
	points(xy, cex=2)
	points(xy, pch=3, col='red')
}
plot(s, addfun=fun)




