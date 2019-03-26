library(move)


### Name: seglength
### Title: Segment lengths of a track
### Aliases: seglength seglength,SpatialPointsDataFrame-method

### ** Examples


## Not run: 
##D ## Move object in longlat projection
##D data(leroy)
##D head(seglength(leroy)) 
##D # to add this information to the move object, a "NA" has to be assigened
##D # e.g. to the last location (it also could be assigend to the first location).
##D leroy$segLength <- c(seglength(leroy), NA)
##D 
##D ## MoveStack object in longlat projection
##D data(fishers)
##D head(seglength(fishers))
##D # to add this information to the moveStack object, a "NA" has to be assigened
##D # e.g. to the last location of each individual (it also could be assigend to the first location).
##D fishers$segLength <-  unlist(lapply(lapply(split(fishers),seglength),c, NA))
## End(Not run)



