library(osmdata)


### Name: trim_osmdata
### Title: trim_osmdata
### Aliases: trim_osmdata

### ** Examples

## Not run: 
##D dat <- opq ("colchester uk") %>%
##D             add_osm_feature (key="highway") %>%
##D             osmdata_sf (quiet = FALSE)
##D bb <- getbb ("colchester uk", format_out = "polygon")
##D library (sf) # required for this function to work
##D dat_tr <- trim_osmdata (dat, bb)
##D bb <- getbb ("colchester uk", format_out = "sf_polygon")
##D class (bb) # sf data.frame
##D dat_tr <- trim_osmdata (dat, bb)
##D bb <- as (bb, "Spatial")
##D class (bb) # SpatialPolygonsDataFrame
##D dat_tr <- trim_osmdata (dat, bb)
## End(Not run)



