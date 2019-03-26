library(osmdata)


### Name: opq
### Title: Build an Overpass query
### Aliases: opq

### ** Examples

## Not run: 
##D q <- getbb ("portsmouth", display_name_contains = "USA") %>%
##D             opq () %>% 
##D             add_osm_feature("amenity", "restaurant") %>%
##D             add_osm_feature("amenity", "pub") 
##D osmdata_sf (q) # all objects that are restaurants AND pubs (there are none!)
##D q1 <- getbb ("portsmouth", display_name_contains = "USA") %>%
##D                 opq () %>% 
##D                 add_osm_feature("amenity", "restaurant") 
##D q2 <- getbb ("portsmouth", display_name_contains = "USA") %>%
##D                 opq () %>% 
##D                 add_osm_feature("amenity", "pub") 
##D c (osmdata_sf (q1), osmdata_sf (q2)) # all objects that are restaurants OR pubs
## End(Not run)



