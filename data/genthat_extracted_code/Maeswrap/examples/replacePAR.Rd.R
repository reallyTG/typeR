library(Maeswrap)


### Name: replaceNameList
### Title: Replaces a namelist or a parameter
### Aliases: replaceNameList replacePAR
### Keywords: utilities

### ** Examples

## Not run: 
##D # Replace an entire namelist
##D replaceNameList(namelist="aerodyn",
##D     datfile="trees.dat", vals=list(zht=30,zpd=3,z0ht=0.6))
##D 
##D #' # Replace a parameter with a single value:
##D replacePAR("trees.dat", "notrees", "plot", newval=100)
##D 
##D # Replace a number of values:
##D replacePAR("trees.dat", "xycoords", "xy", newval=c(1,1,2,2,3,3))
##D 
##D # Replace a number of values in a different way : this may be useful in
##D # more complicated programs,
##D # rr when reading a string from a file (that should be interpreted as a vector).
##D replacePAR("trees.dat", "xycoords", "xy", newval="1 1 2 2 3 3", noquotes=TRUE)
##D 
##D # Replace a parameter so that the new values are placed on multiple rows.
##D # Useful for tree namelists with multiple dates and multiple trees
##D # (where each row corresponds to a tree, and each column to a date.)
##D m <- matrix(c(1,2,3,4,5,6,7,8,9), nrow=3, byrow=TRUE)
##D replacePAR("trees.dat", "values", "indivlarea", newval=m)
## End(Not run)



