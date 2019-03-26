library(causaleffect)


### Name: surrogate.outcome
### Title: Derive a formula for a causal effect using surrogate outcomes
### Aliases: surrogate.outcome

### ** Examples

library(igraph)

# We set simplify = FALSE to allow multiple edges.
g <-  graph.formula(W -+ X, W -+ Z, X -+ Z, Z -+ Y, # Observed edges
  X -+ Z, Z -+ X, simplify = FALSE)

# We set the bidirected edges
g <- set.edge.attribute(g, "description", 5:6, "U")

# We construct the set of available experimental data
s <- list(
  list(Z = c("X"), W = c("Z"))
)

surrogate.outcome(y = "Y", x = "X", S = s, G = g)



