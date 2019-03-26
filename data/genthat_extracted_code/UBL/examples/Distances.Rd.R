library(UBL)


### Name: distances
### Title: Distance matrix between all data set examples according to a
###   selected distance metric.
### Aliases: distances
### Keywords: distances evaluation

### ** Examples

## Not run: 
##D data(ImbC)
##D # determine the distances between each example in ImbC data set
##D # using the "HVDM" distance function.
##D dist1 <- distances(3, ImbC, "HVDM")
##D 
##D # now using the "HEOM" distance function
##D dist2 <- distances(3, ImbC, "HEOM")
##D 
##D # check the differences
##D head(dist1)
##D head(dist2)
## End(Not run)



