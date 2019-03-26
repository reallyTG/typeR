library(cooptrees)


### Name: maCooperative
### Title: Cooperation in minimum cost arborescence problems
### Aliases: maCooperative

### ** Examples

# Graph
nodes <- 1:4
arcs <- matrix(c(1,2,2, 1,3,3, 1,4,4, 2,3,3, 2,4,4, 3,2,3,
                 3,4,1, 4,2,1, 4,3,2), ncol = 3, byrow = TRUE)
# Cooperation in minimum cost arborescence problems
maCooperative(nodes, arcs)



