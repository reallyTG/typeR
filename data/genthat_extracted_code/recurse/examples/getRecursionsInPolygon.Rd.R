library(recurse)


### Name: getRecursionsInPolygon.Move
### Title: Calculates recursion information from the trajectory inside a
###   polygon
### Aliases: getRecursionsInPolygon.Move getRecursionsInPolygon
###   getRecursionsInPolygon.data.frame getRecursionsInPolygon.MoveStack

### ** Examples

data(track)
poly = sp::SpatialPolygons( list(
	 	sp::Polygons( list(sp::Polygon(cbind(c(4,6,6,3,4),c(1,2,4,3,1)))), ID = 1 )
	 	))
revisits = getRecursionsInPolygon(track, poly)



