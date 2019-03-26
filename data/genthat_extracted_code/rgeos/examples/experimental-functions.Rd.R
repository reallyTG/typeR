library(rgeos)


### Name: RGEOS Experimental Functions
### Title: Experimental Functions
### Aliases: poly_findInBoxGEOS gUnarySTRtreeQuery gBinarySTRtreeQuery
### Keywords: spatial

### ** Examples

if (require(maptools)) {
xx <- readShapeSpatial(system.file("shapes/fylk-val-ll.shp",
 package="maptools")[1], proj4string=CRS("+proj=longlat +datum=WGS84"))
a0 <- gUnarySTRtreeQuery(xx)
a0
bbxx <- bbox(xx)
wdb_lines <- system.file("share/wdb_borders_c.b", package="maptools")
xxx <- Rgshhs(wdb_lines, xlim=bbxx[1,], ylim=bbxx[2,])$SP
a1 <- gBinarySTRtreeQuery(xx, xxx)
a1
nc1 <- readShapePoly(system.file("shapes/sids.shp", package="maptools")[1],
 proj4string=CRS("+proj=longlat +datum=NAD27"))
a2 <- gUnarySTRtreeQuery(nc1)
a3 <- poly_findInBoxGEOS(nc1)
all.equal(a2, a3)
a2
pl <- slot(nc1, "polygons")[[4]]
a5 <- gUnarySTRtreeQuery(pl)
a5
SG <- Sobj_SpatialGrid(nc1, n=400)$SG
obj1 <- as(as(SG, "SpatialPixels"), "SpatialPolygons")
a4 <- gBinarySTRtreeQuery(nc1, obj1)
plot(nc1, col="orange", border="yellow")
plot(obj1, angle=sapply(a4, is.null)*45, density=20, lwd=0.5, add=TRUE)
set.seed(1)
pts <- spsample(nc1, n=10, type="random")
res <- gBinarySTRtreeQuery(nc1, pts)
}



