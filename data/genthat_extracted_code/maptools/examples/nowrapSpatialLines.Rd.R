library(maptools)


### Name: nowrapSpatialLines
### Title: Split SpatialLines components at offset
### Aliases: nowrapSpatialLines
### Keywords: spatial

### ** Examples

Sl <- SpatialLines(list(Lines(list(Line(cbind(sin(seq(-4,4,0.4)),
 seq(1,21,1)))), "1")), proj4string=CRS("+proj=longlat +ellps=WGS84"))
summary(Sl)
if (require(rgeos)) {
nwSL <- nowrapSpatialLines(Sl)
summary(nwSL)
if(require(maps)) {
worldmap <- map("world", plot=FALSE)
worldmapLines <- map2SpatialLines(worldmap, proj4string=CRS("+proj=longlat +datum=WGS84"))
bbox(worldmapLines)
t0 <- nowrapSpatialLines(worldmapLines, offset=180)
bbox(t0)
}
}



