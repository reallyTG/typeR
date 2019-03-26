library(mrfDepth)


### Name: dprojdepth
### Title: Directional projection depth of points relative to a dataset
### Aliases: dprojdepth
### Keywords: multivariate

### ** Examples

# Compute the directional projection depth 
# of a simple two-dimensional dataset.
# Outliers are plotted in red.

data(bloodfat)
Result <- dprojdepth(x = bloodfat)
IndOutliers <- which(!Result$flagX)
plot(bloodfat)
points(bloodfat[IndOutliers,], col = "red")

# A multivariate rainbowplot may be obtained using mrainbowplot.
plot.options = list(legend.title = "DPD")
mrainbowplot(x = bloodfat, 
             depths = Result$depthX, plot.options = plot.options)

# Options for the underlying outlyingness routine may be passed 
# using the options argument. 
Result <- dprojdepth(x = bloodfat,options = list(type = "Affine",ndir=100))




