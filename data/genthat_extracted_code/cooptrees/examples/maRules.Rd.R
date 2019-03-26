library(cooptrees)


### Name: maRules
### Title: Allocation rules for minimum cost arborescence problems
### Aliases: maRules

### ** Examples

# Graph
nodes <- 1:4
arcs <- matrix(c(1,2,7, 1,3,6, 1,4,4, 2,3,8, 2,4,6, 3,2,6,
                 3,4,5, 4,2,5, 4,3,7), ncol = 3, byrow = TRUE)
# Allocation rules
maRules(nodes, arcs, rule = "Bird")
maRules(nodes, arcs, rule = "ERO")



