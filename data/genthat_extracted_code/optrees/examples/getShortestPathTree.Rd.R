library(optrees)


### Name: getShortestPathTree
### Title: Computes a shortest path tree
### Aliases: getShortestPathTree

### ** Examples

# Graph
nodes <- 1:5
arcs <- matrix(c(1,2,2, 1,3,2, 1,4,3, 2,5,5, 3,2,4, 3,5,3, 4,3,1, 4,5,0),
               ncol = 3, byrow = TRUE)
# Shortest path tree
getShortestPathTree(nodes, arcs, algorithm = "Dijkstra", directed=FALSE)
getShortestPathTree(nodes, arcs, algorithm = "Bellman-Ford", directed=FALSE)

# Graph with negative weights
nodes <- 1:5
arcs <- matrix(c(1,2,6, 1,3,7, 2,3,8, 2,4,5, 2,5,-4, 3,4,-3, 3,5,9, 4,2,-2,
                 5,1,2, 5,4,7), ncol = 3, byrow = TRUE)
# Shortest path tree
getShortestPathTree(nodes, arcs, algorithm = "Bellman-Ford", directed=TRUE)



