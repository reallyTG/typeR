library(igraph)


### Name: vertex_connectivity
### Title: Vertex connectivity.
### Aliases: vertex_connectivity vertex.connectivity vertex.disjoint.paths
###   cohesion vertex_disjoint_paths graph.cohesion cohesion.igraph
### Keywords: graphs

### ** Examples


g <- barabasi.game(100, m=1)
g <- delete_edges(g, E(g)[ 100 %--% 1 ])
g2 <- barabasi.game(100, m=5)
g2 <- delete_edges(g2, E(g2)[ 100 %--% 1])
vertex_connectivity(g, 100, 1)
vertex_connectivity(g2, 100, 1)
vertex_disjoint_paths(g2, 100, 1)

g <- sample_gnp(50, 5/50)
g <- as.directed(g)
g <- induced_subgraph(g, subcomponent(g, 1))
cohesion(g)




