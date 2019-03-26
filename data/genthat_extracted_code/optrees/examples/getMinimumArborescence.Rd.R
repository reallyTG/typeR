library(optrees)


### Name: getMinimumArborescence
### Title: Computes a minimum cost arborescence
### Aliases: getMinimumArborescence

### ** Examples

# Graph
nodes <- 1:4
arcs <- matrix(c(1,2,2, 1,3,3, 1,4,4, 2,3,3, 2,4,4, 3,2,3,
                 3,4,1, 4,2,1, 4,3,2),byrow = TRUE, ncol = 3)
# Minimum cost arborescence
getMinimumArborescence(nodes, arcs)



