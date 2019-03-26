library(MLEcens)


### Name: plotDens1
### Title: Create a univariate density plot of the MLE
### Aliases: plotDens1
### Keywords: hplot dplot aplot

### ** Examples

# Load example data:
data(ex)

# Compute the MLE:
mle <- computeMLE(ex)

# Bivariate density plot of the MLE:
# (Numbers represent the mass p in the maximal intersections)
par(mfrow=c(2,2))
plotDens2(mle, xlim=range(ex[,1:2]), ylim=range(ex[,3:4]), 
 col="lightgray", main="Bivariate density plot of the MLE", 
 key=FALSE, numbers=TRUE)
plotRects(ex, add=TRUE)

### Univariate density plots of the MLE:

# Plot of the marginal density of Y
plotDens1(mle, margin=2, xlim=range(ex[,3:4]), 
 main="Marginal density plot, 
 y-margin", xlab="y", ylab=expression(f[Y](y))) 

# Plot of the marginal density of X 
plotDens1(mle, margin=1, xlim=range(ex[,1:2]), 
 main="Marginal density plot, 
 x-margin", xlab="x", ylab=expression(f[X](x)))



