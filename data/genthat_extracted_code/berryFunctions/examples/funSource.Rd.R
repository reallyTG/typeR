library(berryFunctions)


### Name: funSource
### Title: Source code of a function
### Aliases: funSource

### ** Examples

## Not run: 
##D  ## browser windows should not be openend in CRAN checks
##D library("berryFunctions")
##D funSource(colPoints)
##D funSource("head")
##D funSource("require", trydirect=FALSE)
##D 
##D funSource(earthDist)
##D funSource(OSMscale::earthDist)
##D funSource("OSMscale::earthDist")
## End(Not run)

## Not run: 
##D  # developmental testing
##D require(plotrix); require(scales)
##D funSource(rescale
##D 
##D tail <- function(...) stop("This is a dummy function. Type: rm(tail)")
##D funSource("tail")
##D rm(tail)
## End(Not run)




