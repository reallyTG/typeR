library(gstat)


### Name: variogramST
### Title: Calculate Spatio-Temporal Sample Variogram
### Aliases: variogramST
### Keywords: models

### ** Examples

# The following spatio-temporal variogram has been calcualted through
# vv = variogram(PM10~1, r5to10, width=20, cutoff = 200, tlags=0:5)
# in the vignette "st".

data(vv)
str(vv)
plot(vv)



