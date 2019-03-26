library(raster)


### Name: shapefile
### Title: Read or write a shapefile
### Aliases: shapefile shapefile,character-method shapefile,Spatial-method
### Keywords: spatial

### ** Examples

if (require(rgdal)) {

filename <- system.file("external/lux.shp", package="raster")
filename
p <- shapefile(filename)

## Not run: 
##D shapefile(p, 'copy.shp')
## End(Not run)
}



