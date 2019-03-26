library(MLEcens)


### Name: reduc
### Title: Determine areas of possible mass support of the MLE
### Aliases: reduc
### Keywords: survival nonparametric manip optimize

### ** Examples

# Load example data:
data(ex)
par(mfrow=c(1,1))

# Plot the observation rectangles
plotRects(ex,main="Example")

# Perform the reduction step
res<-reduc(ex, hm=TRUE, cm=TRUE)

# Shade the maximal intersections
plotRects(res$rects, density=15, add=TRUE, border=NA)

# Plot the height map, together with the observation 
# rectangles (in black) and the maximal intersections (shaded)
plotHM(res$hm, ex)
plotRects(ex, add=TRUE, border="black")
plotRects(res$rects, add=TRUE, border=NA, density=15)

# Print the clique matrix 
res$cm

# Make a plot of the clique matrix (useful for large data sets)
plotCM(res$cm)



