library(rJava)


### Name: jcast
### Title: Cast a Java object to another class
### Aliases: .jcast
### Keywords: interface

### ** Examples

## Not run: 
##D v <- .jnew("java/util/Vector")
##D .jcall("java/lang/System","I","identityHashCode",.jcast(v, "java/lang/Object"))
## End(Not run)



