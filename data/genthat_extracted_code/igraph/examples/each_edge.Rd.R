library(igraph)


### Name: each_edge
### Title: Rewires the endpoints of the edges of a graph to a random vertex
### Aliases: each_edge
### Keywords: graphs

### ** Examples


# Some random shortcuts shorten the distances on a lattice
g <- make_lattice(length = 100, dim = 1, nei = 5)
mean_distance(g)
g <- rewire(g, each_edge(prob = 0.05))
mean_distance(g)



