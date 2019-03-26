library(raster)


### Name: spplot
### Title: Use spplot to plot a Raster* object
### Aliases: spplot spplot,Raster-method spplot,SpatialPoints-method
###   lines,SpatialPolygons-method
### Keywords: methods spatial

### ** Examples
 
r <- raster(system.file("external/test.grd", package="raster"))
s <- stack(r, r*2)
names(s) <- c('meuse', 'meuse x 2')

spplot(s)

pts <- data.frame(sampleRandom(r, 10, xy=TRUE))
coordinates(pts) <- ~ x + y

spplot(s, scales = list(draw = TRUE), 
		xlab = "easting", ylab = "northing", 
		col.regions = rainbow(99, start=.1), 
		names.attr=c('original', 'times two'),
		sp.layout = list("sp.points", pts, pch=20, cex=2, col='black'),
		par.settings = list(fontsize = list(text = 12)), at = seq(0, 4000, 500))




