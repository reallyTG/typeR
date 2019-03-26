library(MLEcens)


### Name: plotCDF2
### Title: Create a bivariate CDF (or survival function) plot of the MLE
### Aliases: plotCDF2
### Keywords: hplot dplot

### ** Examples

# Load example data:
data(ex)

# Compute the MLE:
mle <- computeMLE(ex)

### Bivariate CDF plot of the MLE

# Plot lower bound for representational non-uniqueness
par(mfrow=c(1,1))
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



