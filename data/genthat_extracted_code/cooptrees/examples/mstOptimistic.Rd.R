library(cooptrees)


### Name: mstOptimistic
### Title: Optimistic game of a minimum cost spanning tree problem
### Aliases: mstOptimistic

### ** Examples

# Graph
nodes <- 1:4
arcs <- matrix(c(1,2,6, 1,3,10, 1,4,6, 2,3,4, 2,4,6, 3,4,4),
               byrow = TRUE, ncol = 3)
# Optimistic game
mstOptimistic(nodes, arcs)



