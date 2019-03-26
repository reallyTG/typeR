library(cooptrees)


### Name: mstDuttaKar
### Title: Dutta-Kar rule for minimum cost spanning tree problems
### Aliases: mstDuttaKar

### ** Examples

# Graph
nodes <- 1:4
arcs <- matrix(c(1,2,6, 1,3,10, 1,4,6, 2,3,4, 2,4,6, 3,4,4),
               byrow = TRUE, ncol = 3)
# Dutta-Kar
mstDuttaKar(nodes, arcs)



