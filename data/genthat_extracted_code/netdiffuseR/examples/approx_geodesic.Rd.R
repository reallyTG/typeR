library(netdiffuseR)


### Name: approx_geodesic
### Title: Approximate Geodesic Distances
### Aliases: approx_geodesic Geodesic Shortest-Path approx_geodist

### ** Examples

# A very simple example -----------------------------------------------------
g <- ring_lattice(10, 3)
approx_geodesic(g, 6)
sna::geodist(as.matrix(g))[[2]]
igraph::distances(
  igraph::graph_from_adjacency_matrix(g, mode = "directed"),
  mode = "out"
)




