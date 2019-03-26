library(mvbutils)


### Name: dont.lockBindings
### Title: Helper for live-editing of packages
### Aliases: dont.lockBindings
### Keywords: misc

### ** Examples

## Not run: 
##D library( debug)
##D debug:::.onLoad # d.lB is called to make 'tracees' editable inside 'debug's namespace.
##D debug:::.onAttach # d.lB is called to make 'tracees' editable in the search path
##D # NB also that an active binding is used to ensure that the 'tracees' object in the search...
##D #... path is a "shadow of" or "pointer to" the one in 'debug's namespace; the two cannot get...
##D #... out-of-synch
## End(Not run)



