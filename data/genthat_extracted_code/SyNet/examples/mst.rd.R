library(SyNet)


### Name: mst
### Title: Minimum Spanning Tree
### Aliases: mst
### Keywords: methods

### ** Examples

  xy <- matrix(rnorm(100), ncol = 2) # Sample a random set of points
  plot(xy, xlab = "", ylab = "", main = "MINIMUM SPANNING TREE")
  aux <- mst(as.matrix(dist(xy))) # Find the Euclidean minimum spanning tree
  segments(xy[aux$xy0,1], xy[aux$xy0,2], xy[aux$xy1,1], xy[aux$xy1,2]) # Plot the MST



