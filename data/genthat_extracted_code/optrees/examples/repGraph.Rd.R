library(optrees)


### Name: repGraph
### Title: Visual representation of a graph
### Aliases: repGraph

### ** Examples

# Graph
nodes <- c(1:4)
arcs <- matrix(c(1,2,2, 1,3,15, 2,3,1, 2,4,9, 3,4,1),
               byrow = TRUE, ncol = 3)
# Plot graph
repGraph(nodes, arcs)



