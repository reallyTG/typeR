library(mapmisc)


### Name: GNcities
### Title: Retrieve city names and locations
### Aliases: GNcities GNsearch

### ** Examples


myraster = raster(matrix(0,10,10),xmn=8,xmx=18,ymn=0,ymx=10, 
	crs="+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
values(myraster) = seq(0,1,len=ncell(myraster))
myPoints = SpatialPoints(myraster, proj4string=CRS(proj4string(myraster)))[
	seq(1,ncell(myraster),len=5)]

## Not run: 
##D 
##D if (requireNamespace("geonames", quietly = TRUE)) { 
##D cities=GNcities(myPoints, max=5)
##D mytiles = openmap(myraster)
##D 
##D map.new(cities)
##D plot(mytiles, add=TRUE)
##D points(cities, col='red')
##D text(cities, labels=cities$name, col='red',pos=4)
##D 
##D 
##D cities=GNcities(myraster, max=5)
##D 
##D map.new(cities)
##D plot(mytiles, add=TRUE)
##D points(cities, col='red')
##D text(cities, labels=cities$name, col='red',pos=4)
##D 
##D mapmisc::GNsearch(q="Toronto Ontario")
##D }
## End(Not run)





