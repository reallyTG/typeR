library(igraph)


### Name: complementer
### Title: Complementer of a graph
### Aliases: complementer graph.complementer
### Keywords: graphs

### ** Examples


## Complementer of a ring
g <- make_ring(10)
complementer(g)

## A graph and its complementer give together the full graph
g <- make_ring(10)
gc <- complementer(g)
gu <- union(g, gc)
gu
graph.isomorphic(gu, make_full_graph(vcount(g)))




