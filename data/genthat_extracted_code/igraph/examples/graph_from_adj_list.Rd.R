library(igraph)


### Name: graph_from_adj_list
### Title: Create graphs from adjacency lists
### Aliases: graph_from_adj_list graph.adjlist
### Keywords: graphs

### ** Examples


## Directed
g <- make_ring(10, dir=TRUE)
al <- as_adj_list(g, mode="out")
g2 <- graph_from_adj_list(al)
graph.isomorphic(g, g2)

## Undirected
g <- make_ring(10)
al <- as_adj_list(g)
g2 <- graph_from_adj_list(al, mode="all")
graph.isomorphic(g, g2)
ecount(g2)
g3 <- graph_from_adj_list(al, mode="all", duplicate=FALSE)
ecount(g3)
which_multiple(g3)



