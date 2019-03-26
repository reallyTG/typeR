library(cooptrees)


### Name: mstRules
### Title: Allocation rules for minimum cost spanning tree problem
### Aliases: mstRules

### ** Examples

# Graph
nodes <- 1:4
arcs <- matrix(c(1,2,6, 1,3,10, 1,4,6, 2,3,4, 2,4,6, 3,4,4),
               byrow = TRUE, ncol = 3)
# Allocation Rules
mstRules(nodes, arcs, rule = "Bird")
mstRules(nodes, arcs, rule = "Dutta-Kar")
mstRules(nodes, arcs, rule = "Kar")
mstRules(nodes, arcs, rule = "ERO", algorithm = "Kruskal")



