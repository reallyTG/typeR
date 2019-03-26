library(leafletR)


### Name: toGeoJSON
### Title: Create GeoJSON file from spatial data
### Aliases: toGeoJSON tg
### Keywords: methods

### ** Examples

## Not run: 
##D # convert data frame
##D data(quakes)
##D toGeoJSON(data=quakes, name="quakes", dest=tempdir(), lat.lon=c(1,2))
##D 
##D # convert data frame - minimal call
##D # storing output file path in variable
##D data(quakes)
##D path <- toGeoJSON(data=quakes)
##D 
##D # preserve existing files from overwriting
##D toGeoJSON(data=quakes, overwrite=FALSE)
##D 
##D # convert Spatial objects
##D library(sp)
##D data(meuse)
##D coordinates(meuse) <- ~x+y
##D proj4string(meuse) <- CRS("+init=epsg:28992")
##D toGeoJSON(data=meuse, dest=tempdir()) # rgdal package required
##D 
##D crd <- coordinates(meuse)
##D msl <- SpatialLines(list(Lines(list(Line(crd)), "line1")), 
##D   proj4string=CRS("+init=epsg:28992"))
##D toGeoJSON(data=msl, dest=tempdir()) # rgdal package required
##D 
##D data(meuse.riv)
##D msp <- SpatialPolygons(list(Polygons(list(Polygon(meuse.riv)), 
##D   "meuse.riv")), proj4string=CRS("+init=epsg:28992"))
##D toGeoJSON(data=msp, dest=tempdir()) # rgdal package required
##D 
##D # convert a shapefile (in zipped archive)
##D # (httr package required)
##D toGeoJSON(data=system.file(package="leafletR", "files", "lynx.zip"), 
##D   name="lynx_telemetry", dest=tempdir())
##D 
##D # convert a KML/KMZ file
##D # using name of data file and saving to working directory
##D # (httr package required)
##D toGeoJSON(system.file(package="leafletR", "files", "peak_sk.kmz"))
## End(Not run)



