library(diffeR)


### Name: differenceMR
### Title: calculates difference metrics between a reference map and a
###   comparison map both consecutively aggregated at multiple resolutions
### Aliases: differenceMR
### Keywords: spatial

### ** Examples

## Not run: 
##D comp <- raster(system.file("external/comparison.rst", package="diffeR"))
##D ref <- raster(system.file("external/reference.rst", package="diffeR"))
##D differenceMR(comp, ref, eval="original")
##D differenceMR(comp, ref, eval="multiple", fact=2)
## End(Not run)



