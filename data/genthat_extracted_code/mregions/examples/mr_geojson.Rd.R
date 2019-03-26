library(mregions)


### Name: mr_geojson
### Title: Get a Marineregions geojson file
### Aliases: mr_geojson

### ** Examples

## Not run: 
##D # by key
##D res1 <- mr_geojson(key = "Morocco:dam")
##D 
##D # by name -- not working right now
##D 
##D if (requireNamespace("geojsonio")) {
##D   library("geojsonio")
##D   as.json(unclass(res1)) %>% map_leaf
##D 
##D   # MEOW - marine ecoregions
##D   as.json(unclass(mr_geojson("Ecoregions:ecoregions"))) %>% map_leaf()
##D }
## End(Not run)



