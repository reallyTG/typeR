library(phonTools)


### Name: interpolate
### Title: Interpolation
### Aliases: interpolate

### ** Examples

## generate ten random points
y = rnorm (10, 0, 5)
interpolate (y, show = TRUE)  ## plot a cubic interpolation
linear = interpolate (y, type = 'linear')   
## and compare to a linear interpolation
lines (linear, col = 2) 



