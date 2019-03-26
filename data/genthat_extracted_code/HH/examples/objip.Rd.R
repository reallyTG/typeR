library(HH)


### Name: objip
### Title: loop through all attached directories looking for pattern,
###   possibly restricting to specified class or mode.
### Aliases: objip
### Keywords: utilities

### ** Examples

objip("qq")
objip("^qq")
objip("qq$")
## Not run: 
##D ## R only
##D objip("rowSums", all.names=TRUE)
##D 
##D ## list all objects in the second and third attached packages
##D search()
##D objip()[2:3]
## End(Not run)



