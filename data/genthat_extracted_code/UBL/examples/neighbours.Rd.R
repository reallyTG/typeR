library(UBL)


### Name: neighbours
### Title: Computation of nearest neighbours using a selected distance
###   function.
### Aliases: neighbours
### Keywords: neighbours evaluation

### ** Examples

## Not run: 
##D data(ImbC)
##D # determine the 2 nearest neighbours of each example in ImbC data set
##D # using the "HVDM" distance function.
##D neig1 <- neighbours(3, ImbC, "HVDM", k=2)
##D 
##D # now using the "HEOM" distance function
##D neig2 <- neighbours(3, ImbC, "HEOM", k=2)
##D 
##D # check the differences
##D head(neig1)
##D head(neig2)
## End(Not run)



