library(genridge)


### Name: biplot.pcaridge
### Title: Biplot of Ridge Regression Trace Plot in SVD Space
### Aliases: biplot.pcaridge biplot.ridge
### Keywords: hplot

### ** Examples

longley.y <- longley[, "Employed"]
longley.X <- data.matrix(longley[, c(2:6,1)])

lambda <- c(0, 0.005, 0.01, 0.02, 0.04, 0.08)
lridge <- ridge(longley.y, longley.X, lambda=lambda)

plridge <- pca.ridge(lridge)

plot(plridge, radius=0.5)

# same, with variable vectors
biplot(plridge, radius=0.5)
# add some other options
biplot(plridge, radius=0.5, var.col="brown", var.lwd=2, var.cex=1.2, prefix="Dimension ")

# biplots for ridge objects, showing PCA vectors
plot(lridge, radius=0.5)
biplot(lridge, radius=0.5)
biplot(lridge, radius=0.5, asp=NA)





