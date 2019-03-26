library(pkgcond)


### Name: suppress
### Title: Selectively suppress warnings and messages
### Aliases: suppress suppress_conditions suppress_warnings
###   suppress_messages

### ** Examples

## Not run: 
##D testit <- function(){
##D     warning("this function does nothing.")
##D     warning("it's pretty useless.")
##D }
##D suppress_warning(testit(), "useless")  # Will suppress only the second warning by pattern
##D 
##D 
##D # If my_pkg used pkgcond for conditions,
##D # This would suppress all messages and warnings originating
##D # in my_pkg functions.
##D suppress_conditions(my_function(), class='my_pkg-condition')
## End(Not run)



