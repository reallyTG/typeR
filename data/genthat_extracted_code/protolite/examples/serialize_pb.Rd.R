library(protolite)


### Name: serialize_pb
### Title: Serialize to Protocol Buffers
### Aliases: serialize_pb protolite unserialize_pb

### ** Examples

# Serialize and unserialize an object
buf <- serialize_pb(iris)
out <- unserialize_pb(buf)
stopifnot(identical(iris, out))

## Not run: 
##D  #Fully compatible with RProtoBuf
##D buf <- RProtoBuf::serialize_pb(iris, NULL)
##D out <- protolite::unserialize_pb(buf)
##D stopifnot(identical(iris, out))
##D 
##D # Other way around
##D buf <- protolite::serialize_pb(mtcars, NULL)
##D out <- RProtoBuf::unserialize_pb(buf)
##D stopifnot(identical(mtcars, out))
## End(Not run)



