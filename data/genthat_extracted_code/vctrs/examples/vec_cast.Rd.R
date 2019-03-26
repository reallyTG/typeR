library(vctrs)


### Name: vec_cast
### Title: Cast a vector to specified type
### Aliases: vec_cast vec_cast_common vec_restore vec_cast.logical
###   vec_cast.integer vec_cast.double vec_cast.character vec_cast.list
### Keywords: internal

### ** Examples

# x is a double, but no information is lost
vec_cast(1, integer())

# Information is lost so a warning is generated
## Not run: 
##D vec_cast(1.5, integer())
## End(Not run)

# No sensible coercion is possible so an error is generated
## Not run: 
##D vec_cast(1.5, factor("a"))
## End(Not run)

# Cast to common type
vec_cast_common(factor("a"), factor(c("a", "b")))
vec_cast_common(factor("a"), Sys.Date(), .to = list())



