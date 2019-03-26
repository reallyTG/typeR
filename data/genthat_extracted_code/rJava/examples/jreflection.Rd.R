library(rJava)


### Name: jreflection
### Title: Simple helper functions for Java reflection
### Aliases: .jmethods .jfields .jconstructors
### Keywords: interface

### ** Examples

## Not run: 
##D .jconstructors("java/util/Vector")
##D v <- .jnew("java/util/Vector")
##D .jmethods(v, "add")
## End(Not run)



