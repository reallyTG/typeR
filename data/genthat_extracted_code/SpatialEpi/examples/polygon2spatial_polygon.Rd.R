library(SpatialEpi)


### Name: polygon2spatial_polygon
### Title: Convert a Polygon to a Spatial Polygons Object
### Aliases: polygon2spatial_polygon
### Keywords: file

### ** Examples

data(scotland)

polygon <- scotland$polygon$polygon
coord.system <- '+proj=utm'
names <- scotland$data$county.names
nrepeats <- scotland$polygon$nrepeats

spatial.polygon <- polygon2spatial_polygon(polygon,coord.system,names,nrepeats)

par(mfrow=c(1,2))
# plot using polygon function
plot(polygon,type='n',xlab="Eastings (km)",ylab="Northings (km)",main="Polygon File")
polygon(polygon)

# plot as spatial polygon object
plot(spatial.polygon,axes=TRUE)
title(xlab="Eastings (km)",ylab="Northings (km)",main="Spatial Polygon")

# Note that area 23 (argyll-bute) consists of 8 separate polygons
nrepeats[23]
plot(spatial.polygon[23],add=TRUE,col="red")



