library(Rdistance)


### Name: F.maximize.g
### Title: Find the coordinate of the maximum of a distance function
### Aliases: F.maximize.g
### Keywords: model

### ** Examples

## Not run: 
##D # Fake data
##D set.seed(22223333)
##D x <- rgamma(100, 10, 1)
##D 
##D fit <- dfuncEstim( x, likelihood="Gamma", x.scl="max" )
##D 
##D F.maximize.g( fit )  # should be near 10.
##D fit$x.scl            # same thing
## End(Not run)



