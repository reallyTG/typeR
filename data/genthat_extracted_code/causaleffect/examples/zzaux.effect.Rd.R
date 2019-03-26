library(causaleffect)


### Name: aux.effect
### Title: Identify a causal effect using surrogate experiments
### Aliases: aux.effect

### ** Examples

library(igraph)

# simplify = FALSE to allow multiple edges
f <- graph.formula(W -+ Z, Z -+ X, X -+ Y, W -+ Y, # Observed edges
  W -+ Y, Y -+ W, Z -+ Y, Y -+ Z, Z -+ X, X -+ Z, simplify = FALSE)

# Here the bidirected edges are set to be unobserved in graph g
# This is denoted by giving them a description attribute with the value "U"
# The first 4 edges correspond to the observed edges, the rest are unobserved

f <- set.edge.attribute(f, "description", 5:10, "U")
aux.effect(y = "Y", x = "X", z = "Z", G = f)



