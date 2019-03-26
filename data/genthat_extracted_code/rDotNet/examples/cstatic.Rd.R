library(rDotNet)


### Name: .cstatic
### Title: call a static method of a .NET class
### Aliases: .cstatic

### ** Examples

## Not run: 
##D 
##D ## call MtM static method on MatrixUtils
##D matrix <- diag(c(1,2,3,4,5,6,7))
##D newmat <- .cstatic ("com.stg.math.MatrixUtils", "MtM", matrix)
## End(Not run)


