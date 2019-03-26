library(optrees)


### Name: getMinimumSpanningTree
### Title: Computes a minimum cost spanning tree
### Aliases: getMinimumSpanningTree

### ** Examples

# Graph
nodes <- 1:4
arcs <- matrix(c(1,2,2, 1,3,15, 1,4,3, 2,3,1, 2,4,9, 3,4,1),
               ncol = 3, byrow = TRUE)
# Minimum cost spanning tree with several algorithms
getMinimumSpanningTree(nodes, arcs, algorithm = "Prim")
getMinimumSpanningTree(nodes, arcs, algorithm = "Kruskal")
getMinimumSpanningTree(nodes, arcs, algorithm = "Boruvka")



