library(geojsonsf)


### Name: geojson_sf
### Title: Geojson to sf
### Aliases: geojson_sf

### ** Examples


## character string of GeoJSON

## load 'sf' for print methods
# library(sf)
geojson <- '{ "type" : "Point", "coordinates" : [0, 0] }'
geojson_sf(geojson)


## Not run: 
##D ## GeoJSON at a url
##D myurl <- "http://eric.clst.org/assets/wiki/uploads/Stuff/gz_2010_us_050_00_500k.json"
##D sf <- geojson_sf(myurl)
## End(Not run)




