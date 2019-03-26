library(mrgsolve)


### Name: inventory
### Title: Check whether all required parameters needed in a model are
###   present in an object
### Aliases: inventory

### ** Examples

## Not run: 
##D inventory(mod, idata, CL:V) # parameters defined, inclusively, CL through Volume 
##D inventory(mod, idata, everything()) # all parameters
##D inventory(mod, idata, contains("OCC")) # all parameters containing OCC
##D inventory(mod, idata, -F) # all parameters except F
## End(Not run)



