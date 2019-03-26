library(mvbutils)


### Name: set.finalizer
### Title: Obsolete but automatic finalization for persistent objects
###   created in C.
### Aliases: set.finalizer
### Keywords: misc

### ** Examples

## Not run: 
##D myfun <- function( ...) {
##D   ...0
##D   # Create object, return pointer, and ensure safe disposal
##D   keeper <- set.finalizer( .C( "create_thing", handle=integer(2), ...1)$handle,
##D       "dispose_of_thing")
##D   "cause" + "crash" # whoops, will cause crash: but finalizer will still be called
##D   # "dispose_of_thing" had better be the name of a DLL routine that takes a...
##D   # ... single integer argument, of length 1 or 2
##D   # Intention was to use the object. First param of DLL routine "use_thing" should
##D   # be pointer to thing.
##D   .C( "use_thing", keeper$handle, ...2)
##D }
##D myfun(...)
## End(Not run)



