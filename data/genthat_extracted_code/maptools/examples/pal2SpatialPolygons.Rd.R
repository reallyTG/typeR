library(maptools)


### Name: pal2SpatialPolygons
### Title: Making SpatialPolygons objects from RArcInfo input
### Aliases: pal2SpatialPolygons
### Keywords: spatial

### ** Examples

nc1 <- readShapePoly(system.file("shapes/sids.shp", package="maptools")[1], ID="FIPS")
plot(nc1)
text(coordinates(nc1), labels=row.names(nc1), cex=0.6)
if(require(maps)){
ncmap <- map("county", "north carolina", fill=TRUE, col="transparent",
 plot=FALSE)
IDs <- sapply(strsplit(ncmap$names, "[,:]"), function(x) x[2])
nc2 <- map2SpatialPolygons(ncmap, IDs)
plot(nc2)
text(coordinates(nc2), labels=row.names(nc2), cex=0.6)
}
if(require(RArcInfo)) {
td <- tempdir()
tmpcover <- paste(td, "nc", sep="/")
if (!file.exists(tmpcover)) e00toavc(system.file("share/co37_d90.e00",
 package="maptools")[1], tmpcover)
arc <- get.arcdata(td, "nc")
pal <- get.paldata(td, "nc")
pat <- get.tabledata(paste(td, "info", sep="/"), "NC.PAT")
sapply(pal[[2]], function(x) length(x[[1]]))
IDs <- paste(pat$ST[-1], pat$CO[-1], sep="")
nc3 <- pal2SpatialPolygons(arc, pal, IDs=IDs)
plot(nc3)
text(coordinates(nc3), labels=row.names(nc3), cex=0.6)
}



