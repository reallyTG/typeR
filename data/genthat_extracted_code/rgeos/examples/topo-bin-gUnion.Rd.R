library(rgeos)


### Name: gUnion
### Title: Geometry Union
### Aliases: gUnion gUnaryUnion gUnionCascaded RGEOSUnionCascaded
###   gLineMerge RGEOSLineMerge
### Keywords: spatial,union

### ** Examples

if (require(maptools)) {
nc1 <- readShapePoly(system.file("shapes/sids.shp", package="maptools")[1],
 proj4string=CRS("+proj=longlat +datum=NAD27"))
lps <- coordinates(nc1)
ID <- cut(lps[,1], quantile(lps[,1]), include.lowest=TRUE)
if (version_GEOS0() < "3.3.0") {
   reg4 <- gUnionCascaded(nc1, ID)
} else {
   reg4 <- gUnaryUnion(nc1, ID)
}
row.names(reg4)
par(mfrow=c(2,1))
plot(nc1)
plot(reg4)
par(mfrow=c(1,1))
}
gt <- GridTopology(c(0.05,0.05), c(0.1,0.1), c(2,2))
set.seed(1)
xv <- rnorm(length(coordinates(gt)[,1]))
xvs <- ifelse(xv > 0.2,1,0)
grd <- SpatialGridDataFrame(gt, data.frame(xvs))
spix <- as(grd, "SpatialPixelsDataFrame")
spol <- as(spix, "SpatialPolygonsDataFrame")
image(grd, axes=TRUE)
if (version_GEOS0() < "3.3.0") {
  spol1 <- gUnionCascaded(spol, as.character(spol$xvs))
} else {
  spol1 <- gUnaryUnion(spol, as.character(spol$xvs))
}
plot(spol1, add=TRUE)




