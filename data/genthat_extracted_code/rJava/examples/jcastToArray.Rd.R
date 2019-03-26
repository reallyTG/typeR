library(rJava)


### Name: jcastToArray
### Title: Ensures that a given object is an array reference
### Aliases: .jcastToArray
### Keywords: interface

### ** Examples

## Not run: 
##D a <- .jarray(1:10)
##D print(a)
##D # let's create an array containing the array
##D aa <- .jarray(list(a))
##D print(aa)
##D ba <- .jevalArray(aa)[[1]]
##D # it is NOT the inverse, because .jarray works on a list of objects
##D print(ba)
##D # so we need to cast the object into an array
##D b <- .jcastToArray(ba)
##D # only now a and b are the same array reference
##D print(b)
##D # for convenience .jcastToArray behaves like .jarray for non-references
##D print(.jcastToArray(1:10/2))
## End(Not run)



