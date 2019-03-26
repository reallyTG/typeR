library(mregions)


### Name: mr_as_wkt
### Title: Convert data to WKT
### Aliases: mr_as_wkt

### ** Examples

## Not run: 
##D res <- mr_geojson(key = "Morocco:dam")
##D mr_as_wkt(res, fmt = 5)
##D 
##D # shp files
##D ## path to wkt
##D mr_as_wkt(mr_shp(key = "Morocco:dam", read = FALSE))
##D 
##D ## spatial object to wkt
##D mr_as_wkt(mr_shp(key = "Morocco:dam", read = TRUE))
## End(Not run)



