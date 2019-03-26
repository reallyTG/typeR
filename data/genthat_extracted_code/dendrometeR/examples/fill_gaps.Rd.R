library(dendrometeR)


### Name: fill_gaps
### Title: Fill gaps in dendrometer series
### Aliases: fill_gaps

### ** Examples

## Not run: 
##D 
##D data(dmCD)
##D ## creating some artificial gaps (for demonstration purposes):
##D dmCD[c(873:877,985:990),1] <- NA
##D # slow, as also seasonal models are checked, but best possible gap-filling:
##D dm.gpf <- fill_gaps(dmCD, Hz = 0.01, season = TRUE)
## End(Not run)




