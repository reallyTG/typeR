library(glcm)


### Name: test_raster
### Title: Randomly generated 100x100 test image
### Aliases: test_raster

### ** Examples

# The image was generated with the following code:
require(raster)
set.seed(0)
test_matrix <- matrix(runif(100)*32, nrow=10)
test_raster <- raster(test_matrix, crs='+init=EPSG:4326')
test_raster <- cut(test_raster, seq(0, 32))



