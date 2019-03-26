library(RCurl)


### Name: merge.list
### Title: Method for merging two lists by name
### Aliases: merge.list
### Keywords: manip

### ** Examples

## Not run: 
##D # Not exported.
##D 
##D  merge.list(list(a=1, b = "xyz", c = function(x, y) {x+y}),
##D              list(a = 2, z = "a string"))
##D 
##D   # No values in y
##D  merge.list(list(a=1, b = "xyz", c = function(x, y) {x+y}), list())
##D 
##D   # No values in x
##D  merge.list(list(), list(a=1, b = "xyz", c = function(x, y) {x+y}))
## End(Not run)



