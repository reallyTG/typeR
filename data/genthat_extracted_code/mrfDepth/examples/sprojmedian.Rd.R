library(mrfDepth)


### Name: sprojmedian
### Title: Location estimates based on skewness-adjusted projection depth.
### Aliases: sprojmedian
### Keywords: multivariate

### ** Examples

# Compute a location estimate of a simple two-dimensional dataset.
data(bloodfat)

result <- sprojmedian(x = bloodfat)
plot(bloodfat)
points(result$max, col = "red", pch = 15)
points(result$gravity, col = "blue", pch = 16)


# Options for the underlying sprojdepth routine may be passed 
# using the options argument. 
result <- sprojmedian(x = bloodfat,
                      options = list(type = "Affine",
                                     ndir = 10
                                     )
                     )
plot(bloodfat)
points(result$max, col = "red", pch = 15)
points(result$gravity, col = "blue", pch = 16)

# One may also calculate the depths of the points in the data
# separately. This avoids having to recompute the depths when these
# are previously calculated. 
depth.result <- sprojdepth(x = bloodfat)
result <- sprojmedian(x = bloodfat, 
                      sprojection.depths = depth.result$depthX)



