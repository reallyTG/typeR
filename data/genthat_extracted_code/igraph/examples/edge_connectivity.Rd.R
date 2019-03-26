library(igraph)


### Name: edge_connectivity
### Title: Edge connectivity.
### Aliases: edge_connectivity edge.connectivity edge_disjoint_paths
###   graph.adhesion adhesion edge.disjoint.paths
### Keywords: graphs

### ** Examples


g <- barabasi.game(100, m=1)
g2 <- barabasi.game(100, m=5)
edge_connectivity(g, 100, 1)
edge_connectivity(g2, 100, 1)
edge_disjoint_paths(g2, 100, 1)

g <- sample_gnp(50, 5/50)
g <- as.directed(g)
g <- induced_subgraph(g, subcomponent(g, 1))
adhesion(g)




