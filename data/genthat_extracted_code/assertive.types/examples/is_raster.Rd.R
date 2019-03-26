library(assertive.types)


### Name: assert_is_raster
### Title: Is the input a raster?
### Aliases: assert_is_raster is_raster

### ** Examples

m <- matrix(hcl(0, 80, seq(50, 80, 10)), nrow=4, ncol=5)
assert_is_raster(as.raster(m))
## Not run: 
##D #These examples should fail.
##D assert_is_raster(m)
## End(Not run)



