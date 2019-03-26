library(mrfDepth)


### Name: projdepth
### Title: Projection depth of points relative to a dataset
### Aliases: projdepth
### Keywords: multivariate

### ** Examples


# Compute the projection depth of a simple two-dimensional dataset.
# Outliers are plotted in red.

if (requireNamespace("robustbase", quietly = TRUE)) {
    BivData <- log(robustbase::Animals2)
} else {
  BivData <- matrix(rnorm(120), ncol = 2)
  BivData <- rbind(BivData, matrix(c(6,6, 6, -2), ncol = 2))
}

Result <- projdepth(x = BivData)
IndOutliers <- which(!Result$flagX)
plot(BivData)
points(BivData[IndOutliers,], col = "red")

# A multivariate rainbowplot may be obtained using mrainbowplot.
plot.options = list(legend.title = "PD")
mrainbowplot(x = BivData, 
             depths = Result$depthX, plot.options = plot.options)

# Options for the underlying outlyingness routine may be passed 
# using the options argument. 
Result <- projdepth(x = BivData, 
                    options = list(type = "Affine",
                                   ndir = 1000,
                                   stand = "MedMad",
                                   h = nrow(BivData)
                                   )
                   )




