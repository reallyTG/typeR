library(memuse)


### Name: Constructor
### Title: memuse Constructor
### Aliases: Constructor mu mu,ANY-method mu,NULL-method mu,numeric-method
###   mu,object_size-method mu,missing-method memuse memuse,ANY-method
###   memuse,NULL-method memuse,missing-method memuse,numeric-method
###   memuse,object_size-method
### Keywords: Methods

### ** Examples

## Not run: 
##D ### The value passed as 'size' is the number of bytes
##D x <- memuse(100, unit="kb")
##D x
##D 
##D y <- memuse(100, unit="kb", prefix="SI")
##D y
##D 
##D ### Use the memory usage of object 'size'
##D memuse(rnorm(1e4))
## End(Not run)




