library(svMisc)


### Name: package
### Title: A (possibly) very silent and multi-package library()/require()
###   function
### Aliases: package
### Keywords: utilities

### ** Examples

# This should work...
if (package('tools', 'methods', stop = FALSE)) message("Fine!")
# ... but this not (note that there are no details here!)
if (!package('tools', 'badname', stop = FALSE)) message("Not fine!")
## Not run: 
##D # Get an error
##D package('badname')
## End(Not run)



