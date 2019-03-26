library(dodgr)


### Name: hampi
### Title: hampi
### Aliases: hampi
### Keywords: datasets

### ** Examples

## Not run: 
##D hampi <- dodgr_streetnet("hampi india")
##D cols <- c ("osm_id", "highway", "oneway", "geometry")
##D hampi <- hampi [, which (names (hampi) %in% cols)]
## End(Not run)
# this 'sf data.frame' can be converted to a 'dodgr' network with
net <- weight_streetnet (hampi, wt_profile = 'foot')



