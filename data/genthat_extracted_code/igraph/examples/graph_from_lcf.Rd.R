library(igraph)


### Name: graph_from_lcf
### Title: Creating a graph from LCF notation
### Aliases: graph_from_lcf graph.lcf
### Keywords: graphs

### ** Examples


# This is the Franklin graph:
g1 <- graph_from_lcf(12, c(5,-5), 6)
g2 <- make_graph("Franklin")
isomorphic(g1, g2)



