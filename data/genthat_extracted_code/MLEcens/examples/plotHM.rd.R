library(MLEcens)


### Name: plotHM
### Title: Plot a height map
### Aliases: plotHM
### Keywords: hplot

### ** Examples

# Load example data
data(ex)

# Perform reduction step
res <- reduc(ex, hm=TRUE)

# Plot the height map:
par(mfrow=c(1,1))
plotHM(res$hm, ex, main="Height map")

# Add observation rectangles in black:
plotRects(ex, add=TRUE, border="black")

# Add shaded maximal intersections:
plotRects(res$rects, add=TRUE, border=NA, density=15)

# Compute heightmap of the canonical rectangles:
canon <- real2canon(ex)
res2 <- reduc(canon, hm=TRUE)
# Note that res$hm and res2$hm are identical. So we only need to change
# the x- and y-coordinates of the height map.

# Plot height map of the canonical rectangles
plotHM(res$hm, canon, key=FALSE, numbers=TRUE, main="Canonical height map")

# Add canonical rectangles in black:
plotRects(canon, add=TRUE, border="black")

# Add canonical maximal intersections (local maxima of height map) in red:
plotRects(res2$rects, add=TRUE, border="red")



