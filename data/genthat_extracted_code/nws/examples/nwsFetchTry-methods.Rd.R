library(nws)


### Name: nwsFetchTry
### Title: Fetch a Value from a NetWorkSpace (Non-Blocking Version)
### Aliases: nwsFetchTry nwsFetchTry-methods
###   nwsFetchTry,netWorkSpace-method
### Keywords: methods

### ** Examples

## Not run: 
##D ws <- netWorkSpace('nws example')
##D # If variable 'x' is not found in the shared netWorkSpace,
##D # return default value, NULL.
##D nwsFetchTry(ws, 'x')
##D # If variable 'x' is not found in the shared netWorkSpace, 
##D # return 10.
##D nwsFetchTry(ws, 'x', 10)
## End(Not run)



