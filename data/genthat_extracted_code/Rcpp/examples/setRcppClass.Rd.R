library(Rcpp)


### Name: setRcppClass
### Title: Create a Class Extending a C++ Class
### Aliases: setRcppClass loadRcppClass RcppClass-class
### Keywords: classes

### ** Examples

## Not run: 
##D setRcppClass("World", 
##D     module = "yada", 
##D     fields = list(more = "character"),
##D     methods = list(
##D         test = function(what) message("Testing: ", what, "; ", more)),
##D     saveAs = "genWorld"
##D          )
## End(Not run)



