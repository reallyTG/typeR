library(mrfDepth)


### Name: dprojmedian
### Title: Location estimates based on directional projection depth.
### Aliases: dprojmedian
### Keywords: multivariate

### ** Examples

# Compute a location estimate of a simple two-dimensional dataset.
data(bloodfat)

result <- dprojmedian(x = bloodfat)
plot(bloodfat)
points(result$max, col = "red", pch = 15)
points(result$gravity, col = "blue", pch = 16)


# Options for the underlying sprojdepth routine may be passed 
# using the options argument. 
result <- dprojmedian(x = bloodfat,options = list(type = "Affine",ndir = 10))
plot(bloodfat)
points(result$max, col = "red", pch = 15)
points(result$gravity, col = "blue", pch = 16)

# One may also calculate the depths of the points in the data
# separately. This avoids having to recompute the depths when these
# are previously calculated. 
depth.result <- dprojdepth(x = bloodfat)
result <- dprojmedian(x = bloodfat,dprojection.depths = depth.result$depthX)



