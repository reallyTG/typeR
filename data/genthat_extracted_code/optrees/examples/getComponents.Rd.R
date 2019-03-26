library(optrees)


### Name: getComponents
### Title: Connected components of a graph
### Aliases: getComponents

### ** Examples

# Graph
nodes <- 1:4
arcs <- matrix(c(1,2,1, 1,6,1, 3,4,1, 4,5,1), ncol = 3, byrow = TRUE)
# Components
getComponents(nodes, arcs)



