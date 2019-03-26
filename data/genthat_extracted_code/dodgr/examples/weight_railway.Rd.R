library(dodgr)


### Name: weight_railway
### Title: weight_railway
### Aliases: weight_railway

### ** Examples

## Not run: 
##D # sample railway extraction with the 'osmdata' package
##D library (osmdata)
##D dat <- opq ("shinjuku") %>%
##D     add_osm_feature (key = "railway") %>%
##D     osmdata_sf (quiet = FALSE)
##D graph <- weight_railway (dat$osm_lines)
## End(Not run)



