library(mrfDepth)


### Name: sprojdepth
### Title: Skewness-adjusted projection depth of points relative to a
###   dataset
### Aliases: sprojdepth
### Keywords: multivariate

### ** Examples

# Compute the skewness-adjusted projection depth 
# of a simple two-dimensional dataset.
# Outliers are plotted in red.

data(bloodfat)
Result <- sprojdepth(x = bloodfat)
IndOutliers <- which(!Result$flagX)
plot(bloodfat)
points(bloodfat[IndOutliers,], col = "red")

# A multivariate rainbowplot may be obtained using mrainbowplot.
plot.options = list(legend.title = "SPD")
mrainbowplot(x = bloodfat, 
             depths = Result$depthX, plot.options = plot.options)

# Options for the underlying outlyingness routine may be passed 
# using the options argument. 
Result <- sprojdepth(x = bloodfat, 
                     options = list(type = "Affine",
                                    ndir = 1000,
                                    seed = 12345
                                    )
                    )



