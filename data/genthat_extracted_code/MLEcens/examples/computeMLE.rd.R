library(MLEcens)


### Name: computeMLE
### Title: Compute the MLE for bivariate censored data
### Aliases: computeMLE
### Keywords: survival nonparametric optimize iteration

### ** Examples

# Load example data:
data(ex)
mle <- computeMLE(ex)
par(mfrow=c(2,2))

#### Bivariate density plots of the MLE:

# The colors represent the density=p/(area of maximal intersection)
plotDens2(mle, xlim=range(ex[,1:2]), ylim=range(ex[,3:4]), 
 main="Bivariate density plot of the MLE")
plotRects(ex, add=TRUE)

# Alternative: numbers represent the mass p in the maximal intersections
plotDens2(mle, xlim=range(ex[,1:2]), ylim=range(ex[,3:4]), 
 col="lightgray", main="Bivariate density plot of the MLE", 
 key=FALSE, numbers=TRUE)
plotRects(ex, add=TRUE)

#### Univariate density plots of the MLE:

# Plot univariate density for X
plotDens1(mle, margin=1, xlim=range(ex[,1:2]), 
 main="Marginal density plot, 
 x-margin", xlab="x", ylab=expression(f[X](x)))

# Plot univariate density for Y
plotDens1(mle, margin=2, xlim=range(ex[,3:4]), 
 main="Marginal density plot, 
 y-margin", xlab="y", ylab=expression(f[Y](y))) 

### Bivariate CDF plots of the MLE:

# Plot lower bound for representational non-uniqueness
plotCDF2(mle, xlim=c(min(ex[,1])-1,max(ex[,2])+1), 
 ylim=c(min(ex[,3])-1, max(ex[,4])+1), bound="l", n.key=4,
 main="Bivariate CDF plot of the MLE,
 lower bound")

# Add observation rectangles and shaded maximal intersections
plotRects(ex, add=TRUE) 
plotRects(mle$rects, density=20, border=NA, add=TRUE) 

# Plot upper bound for representational non-uniqueness
plotCDF2(mle, xlim=c(min(ex[,1])-1,max(ex[,2])+1), 
 ylim=c(min(ex[,3])-1, max(ex[,4])+1), bound="u", n.key=4,
 main="Bivariate CDF plot of the MLE, 
 upper bound")

# Add observation rectangles and shaded maximal intersections
plotRects(ex, add=TRUE)
plotRects(mle$rects, density=20, border=NA, add=TRUE)

### Marginal CDF plots of the MLE:

# Plot marginal CDF for X
plotCDF1(mle, margin=1, xlim=c(min(ex[,1])-1,max(ex[,2])+1), 
 bound="b", xlab="x", ylab="P(X<=x)", main="MLE for P(X<=x)")

# Plot marginal CDF for Y
plotCDF1(mle, margin=2, xlim=c(min(ex[,3])-1,max(ex[,4])+1), 
 bound="b", xlab="y", ylab="P(Y<=y)", main="MLE for P(Y<=y)")



