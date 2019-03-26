library(MLEcens)


### Name: plotCM
### Title: Plot a clique matrix
### Aliases: plotCM
### Keywords: hplot

### ** Examples

# Load example data and plot observation rectangles
data(ex)
par(mfrow=c(2,1))
plotRects(ex,main="Rectangles and maximal intersections")

# Perform reduction step and plot maximal intersections (shaded)
res<-reduc(ex, cm=TRUE)
plotRects(res$rects, density=15, border=NA, add=TRUE)

# Plot clique matrix
plotCM(res$cm, main="Clique matrix")



