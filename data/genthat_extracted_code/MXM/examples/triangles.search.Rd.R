library(MXM)


### Name: Search for triangles in an undirected graph
### Title: Search for triangles in an undirected graph
### Aliases: triangles.search

### ** Examples

set.seed(123)
x <- rdag2(1000, p = 30, nei = 5)$x
a <- pc.skel(x, alpha = 0.05)
plotnetwork(a$G)
triangles.search(a$G)



