library(MLEcens)


### Name: plotDens2
### Title: Create a bivariate density plot of the MLE
### Aliases: plotDens2
### Keywords: hplot dplot

### ** Examples

# Load example data:
data(ex)

# Compute the MLE:
mle <- computeMLE(ex)

### Bivariate density plots of the MLE:

# (The colors represent the density=p/(area of maximal intersection))
par(mfrow=c(1,1))
plotDens2(mle, xlim=range(ex[,1:2]), ylim=range(ex[,3:4]), 
 main="Plot of the MLE. Colors represent the density.")
plotRects(ex, add=TRUE)

# Alternative: numbers show the amount of mass in each maximal intersection
plotDens2(mle, col="lightgray", xlim=range(ex[,1:2]), 
 ylim=range(ex[,3:4]), numbers=TRUE, key=FALSE, 
 main="Plot of the MLE")
plotRects(ex, add=TRUE)



