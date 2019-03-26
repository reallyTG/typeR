library(maptools)


### Name: nowrapRecenter
### Title: Break polygons at meridian for recentering
### Aliases: nowrapRecenter nowrapSpatialPolygons
### Keywords: spatial

### ** Examples

## Not run: 
##D if (require(maps)) {
##D world <- map("world", fill=TRUE, col="transparent", plot=FALSE)
##D worldSpP <- map2SpatialPolygons(world, world$names, CRS("+proj=longlat +ellps=WGS84"))
##D worldSpP <- worldSpP[-grep("Antarctica", row.names(worldSpP)),]
##D # incomplete polygons
##D worldSpP <- worldSpP[-grep("Ghana", row.names(worldSpP)),]
##D # self-intersection mouth of Volta
##D worldSpP <- worldSpP[-grep("UK:Great Britain", row.names(worldSpP)),]
##D # self-intersection Humber estuary
##D worldSpPr <- recenter(worldSpP)
##D plot(worldSpPr)
##D title("Pacific view without polygon splitting")
##D worldSpPnr <- nowrapRecenter(worldSpP)
##D plot(worldSpPnr)
##D title("Pacific view with polygon splitting")
##D }
## End(Not run)
if (rgeosStatus()) {
crds <- matrix(c(-1, 1, 1, -1, 50, 50, 52, 52), ncol=2)
rcrds <- rbind(crds, crds[1,])
SR <- SpatialPolygons(list(Polygons(list(Polygon(rcrds)), ID="r1")),
 proj4string=CRS("+proj=longlat +ellps=WGS84"))
bbox(SR)
SRr <- recenter(SR)
bbox(SRr)
SRnr <- nowrapRecenter(SR)
bbox(SRnr)
}



