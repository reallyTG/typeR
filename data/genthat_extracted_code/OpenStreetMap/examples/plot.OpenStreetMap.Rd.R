library(OpenStreetMap)


### Name: plot.OpenStreetMap
### Title: Plot an OpenStreetMap object.
### Aliases: plot.OpenStreetMap

### ** Examples

## Not run: 
##D #
##D #	The following examples
##D #	plot using native mercator coordinates,
##D #	transforming the data where needed
##D #
##D library(sp)
##D m <- c(25.7738889,-80.1938889)
##D j <- c(58.3019444,-134.4197222)
##D miami <- projectMercator(25.7738889,-80.1938889)
##D jun <- projectMercator(58.3019444,-134.4197222)
##D data(states)
##D map <- openmap(j,m,4,type="stamen-terrain")
##D plot(map,removeMargin=FALSE)
##D plot(states,add=TRUE)
##D 
##D data(LA_places)
##D longBeachHarbor <- openmap(c(33.760525217369974,-118.22052955627441),
##D 	c(33.73290566922855,-118.17521095275879),14,'bing')
##D coords <- coordinates(LA_places)
##D x <- coords[,1]
##D y <- coords[,2]
##D txt <- slot(LA_places,"data")[,'NAME']
##D plot(longBeachHarbor)
##D points(x,y,col="red")
##D text(x,y,txt,col="white",adj=0)
##D 
##D if(require(UScensus2010)){
##D #install with: install.tract("linux")
##D if(require(UScensus2010tract)){
##D 	lat <- c(43.834526782236814,30.334953881988564)
##D 	lon <- c(-131.0888671875  ,-107.8857421875)
##D 	southwest <- openmap(c(lat[1],lon[1]),c(lat[2],lon[2]),5,'osm')
##D 	data(california.tract10)
##D 	cali <- spTransform(california.tract10,osm())
##D 	
##D 	plot(southwest)
##D 	plot(cali,add=TRUE)
##D }
##D }
##D 
##D #
##D #	The same plot using apple's maps and long-lat coordinates, 
##D #   transforming the raster map.
##D #
##D if(require(UScensus2010)){
##D #install with: install.tract("linux")
##D if(require(UScensus2010tract)){
##D 	lat <- c(43.834526782236814,30.334953881988564)
##D 	lon <- c(-131.0888671875  ,-107.8857421875)
##D 	southwest <- openmap(c(lat[1],lon[1]),
##D 			c(lat[2],lon[2]),5,"apple-iphoto")
##D 	southwest_longlat <- openproj(southwest)
##D 	data(california.tract10)
##D 	plot(southwest_longlat)
##D 	plot(california.tract10,add=TRUE)
##D }
##D }
## End(Not run)



