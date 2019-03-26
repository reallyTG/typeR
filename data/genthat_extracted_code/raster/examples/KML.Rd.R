library(raster)


### Name: KML
### Title: Write a KML or KMZ file
### Aliases: KML KML,Spatial-method KML,RasterLayer-method
###   KML,RasterStackBrick-method
### Keywords: spatial

### ** Examples

## Not run: 
##D # Meuse data from the sp package
##D data(meuse.grid)
##D b <- rasterFromXYZ(meuse.grid)
##D projection(b) <- "+init=epsg:28992" 				  
##D # transform to longitude/latitude
##D p <- projectRaster(b, crs="+proj=longlat +datum=WGS84", method='ngb')
##D KML(p, file='meuse.kml')
## End(Not run)



