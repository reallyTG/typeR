library(SciViews)


### Name: vectorplot
### Title: Plot vectors inside a unit circle (PCA loadings or correlations
###   plots).
### Aliases: vectorplot vectorplot.default vectorplot.loadings
###   vectorplot.Correlation
### Keywords: aplot

### ** Examples

# Create a PCA and plot loadings and correlations
iris.pca <- pcomp(iris[, -5])
vectorplot(loadings(iris.pca))
vectorplot(Correlation(iris.pca))
# Note: on screen devices, change aspect ratio of the graph by resizing
# the window to reveal cropped labels...



