library(Rnightlights)


### Name: masqVIIRS
### Title: extract data from a raster using one polygon in a multipolygon
### Aliases: masqVIIRS

### ** Examples

## Not run: 
##D ctryPoly <- rgdal::readOGR('path/to/polygon.shp')
##D 
##D ctryRaster <- raster::raster('path/to/raster.tif')
##D 
##D #get the sum of nightlight pixels in the first polygon in a multipolygon
##D sumPolygon1 <- sum(masqVIIRS(ctryPoly, ctryRaster, 1), na.rm=T)
## End(Not run)




