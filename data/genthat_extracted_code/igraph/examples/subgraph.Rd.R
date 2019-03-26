library(igraph)


### Name: subgraph
### Title: Subgraph of a graph
### Aliases: subgraph induced.subgraph subgraph.edges induced_subgraph
###   induced_subgraph subgraph.edges
### Keywords: graphs

### ** Examples


g <- make_ring(10)
g2 <- induced_subgraph(g, 1:7)
g3 <- subgraph.edges(g, 1:5, 1:5)




