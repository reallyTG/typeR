library(rangeBuilder)


### Name: getExtentOfList
### Title: Get extent of list of SpatialPolygons
### Aliases: getExtentOfList

### ** Examples

data(crotalus)

# create some polygons, in this case convex hulls
sp <- split(crotalus, crotalus$genSp)
sp <- lapply(sp, function(x) x[,c('decimallongitude','decimallatitude')])
sp <- lapply(sp, function(x) x[chull(x),])
poly <- lapply(sp, function(x) 
	SpatialPolygons(list(Polygons(list(Polygon(x)), ID = 1))))

getExtentOfList(poly)



