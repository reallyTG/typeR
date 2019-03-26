library(causaleffect)


### Name: causal.effect
### Title: Identify a causal effect
### Aliases: causal.effect

### ** Examples

library(igraph)

# simplify = FALSE to allow multiple edges
g <- graph.formula(x -+ y, z -+ x, z -+ y , x -+ z, z -+ x, simplify = FALSE)

# Here the bidirected edge between X and Z is set to be unobserved in graph g
# This is denoted by giving them a description attribute with the value "U"
# The edges in question are the fourth and the fifth edge
g <- set.edge.attribute(graph = g, name = "description", index = c(4,5), value = "U")
causal.effect(y = "y", x = "x", G = g)

# Pruning example
p <- graph.formula(x -+ z_4, z_4 -+ y, z_1 -+ x, z_2 -+ z_1, 
  z_3 -+ z_2, z_3 -+ x, z_5 -+ z_1, z_5 -+ z_4, x -+ z_2, z_2 -+ x, 
  z_3 -+ z_2, z_2 -+ z_3, z_2 -+ y, y -+ z_2,
  z_4 -+ y, y -+ z_4, z_5 -+ z_4, z_4 -+ z_5, simplify = FALSE)
p <- set.edge.attribute(p, "description", 9:18, "U")
causal.effect("y", "x", G = p, primes = TRUE, simp = TRUE, prune = TRUE)



