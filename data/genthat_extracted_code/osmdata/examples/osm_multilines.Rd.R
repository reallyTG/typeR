library(osmdata)


### Name: osm_multilines
### Title: Extract all 'osm_multilines' from an osmdata object
### Aliases: osm_multilines

### ** Examples

## Not run: 
##D dat <- opq ("London UK") %>% 
##D     add_osm_feature (key="name", value="Thames", exact=FALSE) %>% osmdata_sf ()
##D # Get ids of lines called "The Thames":
##D id <- rownames (dat$osm_lines [which (dat$osm_lines$name == "The Thames"),])
##D # and find all multilinestring objects which include those lines:
##D osm_multilines (dat, id)
##D # Now note that
##D nrow (dat$osm_multilines) # = 24 multiline objects
##D nrow (osm_multilines (dat, id)) # = 1 - the recursive search selects the
##D                                 # single multiline containing "The Thames"
## End(Not run)



