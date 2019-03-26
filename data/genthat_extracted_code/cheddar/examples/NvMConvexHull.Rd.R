library(cheddar)


### Name: NvMConvexHull
### Title: NvMConvexHull
### Aliases: NvMConvexHull
### Keywords: utilities

### ** Examples

data(TL84)

# Compute convex hull
convex.hull <- NvMConvexHull(TL84)

# The nodes that form the hull
convex.hull$nodes

# The area of the hull
convex.hull$area

# Plot the hull in red around the nodes
PlotNvM(TL84)
polygon(convex.hull$points, lwd=2, border='red')



