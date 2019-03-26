library(osmdata)


### Name: osm_multipolygons
### Title: Extract all 'osm_multipolygons' from an osmdata object
### Aliases: osm_multipolygons

### ** Examples

## Not run: 
##D # find all multipolygons which contain the single polygon called 
##D # "Chiswick Eyot" (which is an island).
##D dat <- opq ("London UK") %>% 
##D     add_osm_feature (key="name", value="Thames", exact=FALSE) %>% osmdata_sf ()
##D id <- rownames (dat$osm_polygons [which (dat$osm_polygons$name == "Chiswick Eyot"),])
##D osm_multipolygons (dat, id)
##D # That multipolygon is the Thames itself, but note that
##D nrow (dat$osm_multipolygons) # = 14 multipolygon objects
##D nrow (osm_multipolygons (dat, id)) # = 1 - the main Thames multipolygon
## End(Not run)



