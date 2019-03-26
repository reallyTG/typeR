library(ape)


### Name: varCompPhylip
### Title: Variance Components with Orthonormal Contrasts
### Aliases: varCompPhylip
### Keywords: regression

### ** Examples

## Not run: 
##D tr <- rcoal(30)
##D ### Five traits, one observation per species:
##D x <- replicate(5, rTraitCont(tr, sigma = 1))
##D varCompPhylip(x, tr) # varE is small
##D x <- replicate(5, rnorm(30))
##D varCompPhylip(x, tr) # varE is large
##D ### Five traits, ten observations per species:
##D x <- replicate(30, replicate(5, rnorm(10)), simplify = FALSE)
##D varCompPhylip(x, tr)
## End(Not run)


