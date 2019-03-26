library(osmdata)


### Name: osm_poly2line
### Title: Convert osmdata polygons into lines
### Aliases: osm_poly2line

### ** Examples

## Not run: 
##D dat <- opq ("colchester uk") %>%
##D             add_osm_feature (key="highway") %>%
##D             osmdata_sf ()
##D # colchester has lots of roundabouts, and these are stored in 'osm_polygons'
##D # rather than 'osm_lines'. The former can be merged with the latter by:
##D dat2 <- osm_poly2line (dat)
##D # 'dat2' will have more lines than 'dat', but the same number of polygons (they
##D # are left unchanged.) 
## End(Not run)



