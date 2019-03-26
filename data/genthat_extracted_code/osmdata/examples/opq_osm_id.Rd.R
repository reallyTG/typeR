library(osmdata)


### Name: opq_osm_id
### Title: Add a feature specified by OSM ID to an Overpass query
### Aliases: opq_osm_id

### ** Examples

## Not run: 
##D id <- c (1489221200, 1489221321, 1489221491)
##D dat1 <- opq_osm_id (type = "node", id = id) %>%
##D     opq_string () %>%
##D     osmdata_sf ()
##D dat1$osm_points # the desired nodes
##D id <- c (136190595, 136190596)
##D dat2 <- opq_osm_id (type = "way", id = id) %>%
##D     opq_string () %>%
##D     osmdata_sf ()
##D dat2$osm_lines # the desired ways
##D dat <- c (dat1, dat2) # The node and way data combined
## End(Not run)



