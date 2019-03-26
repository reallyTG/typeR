library(GSIF)


### Name: getID
### Title: Derive 1 degree cell IDs
### Aliases: getID getID,SpatialPolygons-method
### Keywords: methods

### ** Examples

library(sp)
## Bounding box for Malawi:
bbox = expand.grid(lon=c(32.67152, 35.915046), lat=c(-17.12721, -9.363796))
bbox[5,] <- bbox[1,]
crs = CRS("+proj=longlat +datum=WGS84")
x <- SpatialPolygons(list(Polygons(list(Polygon(bbox)), ID="1")), proj4string=crs)
ID.lst <- getID(x)



