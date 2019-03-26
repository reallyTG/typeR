library(neurobase)


### Name: ortho2
### Title: Orthographic Display, added options
### Aliases: ortho2

### ** Examples

x = oro.nifti::nifti(array(rnorm(1000), dim = rep(10, 3)))
ortho2(x)
y = x > 2
ortho2(x, y)
arr_x = as.array(x)
arr_y = as.array(y)
ortho2( arr_x)
ortho2( arr_x, arr_y, useRaster = FALSE)



