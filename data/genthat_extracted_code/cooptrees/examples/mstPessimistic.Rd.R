library(cooptrees)


### Name: mstPessimistic
### Title: Pessimistic game from a minimum cost spanning tree problem
### Aliases: mstPessimistic

### ** Examples

# Graph
nodes <- 1:4
arcs <- matrix(c(1,2,6, 1,3,10, 1,4,6, 2,3,4, 2,4,6, 3,4,4),
               byrow = TRUE, ncol = 3)
# Pessimistic game
mstPessimistic(nodes, arcs)



