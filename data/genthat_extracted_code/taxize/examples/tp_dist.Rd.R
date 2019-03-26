library(taxize)


### Name: tp_dist
### Title: Return all distribution records for for a taxon name with a
###   given id.
### Aliases: tp_dist

### ** Examples

## Not run: 
##D # Query using a taxon name Id
##D out <- tp_dist(id = 25509881)
##D ## just location data
##D head(out[['location']])
##D ## just reference data
##D head(out[['reference']])
## End(Not run)



