library(bomrang)


### Name: get_satellite_imagery
### Title: Get BOM Satellite GeoTIFF Imagery
### Aliases: get_satellite_imagery

### ** Examples

## Not run: 
##D # Fetch AHI VIS (true colour) / IR (Ch13 greyscale) composite 1km FD
##D # GEOS GIS raster stack for most recent single scan available
##D 
##D imagery <- get_satellite_imagery(product_id = "IDE00425", scans = 1)
##D 
##D # Get a list of available image files and use that to specify files for
##D # download, downloading the two most recent files available
##D 
##D avail <- get_available_imagery(product_id = "IDE00425")
##D imagery <- get_satellite_imagery(product_id = avail, scans = 2)
##D 
## End(Not run)



