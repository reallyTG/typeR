library(raster)


### Name: select
### Title: Geometric subsetting
### Aliases: select select,Raster-method select,Spatial-method
### Keywords: spatial

### ** Examples

## Not run: 
##D 
##D # select a subset of a RasterLayer
##D r <- raster(nrow=10, ncol=10)
##D r[] <- 1:ncell(r)
##D plot(r)
##D s <- select(r) # now click on the map twice
##D 
##D # plot the selection on a new canvas:
##D x11()
##D plot(s)
##D 
##D 
##D # select a subset of a SpatialPolygons object
##D p1 <- rbind(c(-180,-20), c(-140,55), c(10, 0), c(-140,-60), c(-180,-20))
##D hole <- rbind(c(-150,-20), c(-100,-10), c(-110,20), c(-150,-20))
##D p2 <- rbind(c(-10,0), c(140,60), c(160,0), c(140,-55), c(-10,0))
##D p3 <- rbind(c(-125,0), c(0,60), c(40,5), c(15,-45), c(-125,0))
##D pols <- SpatialPolygons( list(  Polygons(list(Polygon(p1), Polygon(hole)), 1),
##D       Polygons(list(Polygon(p2)), 2), Polygons(list(Polygon(p3)), 3)))
##D pols@polygons[[1]]@Polygons[[2]]@hole <- TRUE
##D 
##D plot(pols, col=rainbow(3))
##D ps <- select(pols) # now click on the map twice
##D ps
## End(Not run)



