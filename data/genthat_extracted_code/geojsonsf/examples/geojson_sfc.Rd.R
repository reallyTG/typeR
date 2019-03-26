library(geojsonsf)


### Name: geojson_sfc
### Title: Geojson to sfc
### Aliases: geojson_sfc

### ** Examples


## character string of GeoJSON

## load 'sf' for print methods
# library(sf)
geojson <- '{ "type":"Point","coordinates":[0,0] }'
geojson_sfc(geojson)

geojson <- '[
  { "type":"Point","coordinates":[0,0]},
  {"type":"LineString","coordinates":[[0,0],[1,1]]}
  ]'
geojson_sfc( geojson )

## Not run: 
##D ## GeoJSON at a url
##D myurl <- "http://eric.clst.org/assets/wiki/uploads/Stuff/gz_2010_us_050_00_500k.json"
##D sf <- geojson_sfc(myurl)
## End(Not run)




