library(optrees)


### Name: checkGraph
### Title: Checks if the graph contains at least one tree or one
###   arborescence
### Aliases: checkGraph

### ** Examples

# Graph
nodes <- 1:4
arcs <- matrix(c(1,2,2, 1,3,15, 2,3,1, 2,4,9, 3,4,1),
               byrow = TRUE, ncol = 3)
# Check graph
checkGraph(nodes, arcs)



