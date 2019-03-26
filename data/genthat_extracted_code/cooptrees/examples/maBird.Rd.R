library(cooptrees)


### Name: maBird
### Title: Bird rule for minimum cost arborescence problems
### Aliases: maBird

### ** Examples

# Graph
nodes <- 1:4
arcs <- matrix(c(1,2,7, 1,3,6, 1,4,4, 2,3,8, 2,4,6, 3,2,6,
                 3,4,5, 4,2,5, 4,3,7), ncol = 3, byrow = TRUE)
# Bird
maBird(nodes, arcs)



