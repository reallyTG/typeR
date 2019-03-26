library(rDotNet)


### Name: .ccall
### Title: call a method on a .NET object
### Aliases: .ccall $.rDotNet

### ** Examples

## Not run: 
##D series <- rnorm(100)
##D 
##D ## create instance of an object, using fully qualified class name
##D obj <- .cnew ("com.stg.math.Model", 1.0, 3.5)
##D 
##D ## call method F(3) on object
##D val <- .ccall (obj, "F", 3)
##D 
##D ## call overload method F of 2 arguments F(3,4) on object
##D val <- .ccall (obj, "F", 3, 4)
##D 
##D ## call method Estimate(series) on object
##D series <- rnorm(100)
##D val <- .ccall (obj, "Estimate", series)
## End(Not run)




