library(raster)


### Name: projection
### Title: Get or set a coordinate reference system (projection)
### Aliases: crs crs,ANY-method crs<- projection projection<- proj4string
###   proj4string<- as.character,CRS-method is.na,CRS-method
###   crs<-,BasicRaster-method crs<-,Spatial-method
### Keywords: spatial

### ** Examples
 
r <- raster()
crs(r)
crs(r) <- "+proj=lcc +lat_1=48 +lat_2=33 +lon_0=-100 +ellps=WGS84"
crs(r)



