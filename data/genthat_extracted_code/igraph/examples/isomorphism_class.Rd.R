library(igraph)


### Name: isomorphism_class
### Title: Isomorphism class of a graph
### Aliases: isomorphism_class graph.isoclass graph.isoclass.subgraph

### ** Examples

# create some non-isomorphic graphs
g1 <- graph_from_isomorphism_class(3, 10)
g2 <- graph_from_isomorphism_class(3, 11)
isomorphism_class(g1)
isomorphism_class(g2)
isomorphic(g1, g2)



