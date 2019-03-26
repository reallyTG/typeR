library(spdep)


### Name: nb2lines
### Title: Use arc-type shapefiles for import and export of weights
### Aliases: nb2lines listw2lines df2sn
### Keywords: spatial

### ** Examples

#require(maptools)
if (require(rgdal, quietly=TRUE)) {
example(columbus)
coords <- coordinates(columbus)
res <- listw2lines(nb2listw(col.gal.nb), coords)
summary(res)
tf <- paste0(tempdir(), "/nbshape.gpkg")
writeOGR(res, dsn=tf, layer="nbshape", driver="GPKG")
inMap <- readOGR(tf)
summary(inMap)
diffnb(sn2listw(df2sn(as(inMap, "data.frame")))$neighbours, col.gal.nb)
}


