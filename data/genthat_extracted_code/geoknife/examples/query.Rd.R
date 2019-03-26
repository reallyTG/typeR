library(geoknife)


### Name: query
### Title: query webdata for various fields
### Aliases: query query,webdata-method query,webdata,character-method
###   query,webdata,missing-method query,character,missing-method
###   query,webgeom,character-method query,webgeom-method
###   query,webprocess,character-method query,webprocess-method
### Keywords: methods

### ** Examples

## Not run: 
##D fabric <- webdata('prism')
##D query(fabric, 'variables')
##D wg <- webgeom()
##D query(wg, 'geoms')
##D geom(wg) <- "sample:CONUS_states"
##D query(wg, 'attributes')
##D attribute(wg) <- 'STATE'
##D query(wg, 'values', rm.duplicates = TRUE)
## End(Not run)



