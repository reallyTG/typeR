library(osmdata)


### Name: add_osm_feature
### Title: Add a feature to an Overpass query
### Aliases: add_osm_feature add_feature

### ** Examples

## Not run: 
##D q <- getbb ("portsmouth", display_name_contains = "United States") %>%
##D                 opq () %>% 
##D                 add_osm_feature("amenity", "restaurant") %>%
##D                 add_osm_feature("amenity", "pub") 
##D osmdata_sf (q) # all objects that are restaurants AND pubs (there are none!)
##D q1 <- getbb ("portsmouth", display_name_contains = "United States") %>%
##D                 opq () %>% 
##D                 add_osm_feature("amenity", "restaurant") 
##D q2 <- getbb ("portsmouth", display_name_contains = "United States") %>%
##D                 opq () %>% 
##D                 add_osm_feature("amenity", "pub") 
##D c (osmdata_sf (q1), osmdata_sf (q2)) # all objects that are restaurants OR pubs
##D # Use of negation to extract all non-primary highways
##D q <- opq ("portsmouth uk") %>%
##D         add_osm_feature (key="highway", value = "!primary") 
## End(Not run)



