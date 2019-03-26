library(SpatialVx)


### Name: clusterer
### Title: Cluster Analysis Verification
### Aliases: clusterer clusterer.default clusterer.SpatialVx
###   summary.clusterer plot.clusterer plot.summary.clusterer
###   print.clusterer
### Keywords: cluster hplot

### ** Examples

data( "UKobs6" )
data( "UKfcst6" )
look <- clusterer(X=UKobs6, Y=UKfcst6, threshold=16, trans="log", verbose=TRUE)
plot( look )

## Not run: 
##D data( "UKloc" )
##D 
##D # Now, do the same thing, but using a "SpatialVx" object.
##D hold <- make.SpatialVx( UKobs6, UKfcst6, loc = UKloc, map = TRUE,
##D     field.type = "Rainfall", units = "mm/h",
##D     data.name = "Nimrod", obs.name = "obs 6", model.name = "fcst 6" )
##D 
##D look2 <- clusterer(hold, threshold=16, trans="log", verbose=TRUE)
##D plot( look2 )
##D # Note that values differ because now we're using the
##D # actual locations instead of integer indicators of
##D # positions.
## End(Not run)



