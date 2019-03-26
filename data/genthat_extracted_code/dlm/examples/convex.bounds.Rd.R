library(dlm)


### Name: convex.bounds
### Title: Find the boundaries of a convex set
### Aliases: convex.bounds
### Keywords: misc

### ** Examples

## boundaries of a unit circle
convex.bounds(c(0,0), c(1,1), indFunc=function(x) crossprod(x)<1)



