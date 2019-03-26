library(osmdata)


### Name: osm_polygons
### Title: Extract all 'osm_polygons' from an osmdata object
### Aliases: osm_polygons

### ** Examples

## Not run: 
##D Extract polygons which intersect Conway Street in London
##D dat <- opq ("Marylebone London") %>% add_osm_feature (key="highway") %>% 
##D     osmdata_sf ()
##D conway <- which (dat$osm_lines$name == "Conway Street") 
##D id <- rownames (dat$osm_lines [conway,])
##D osm_polygons (dat, id)
## End(Not run)



