library(causaleffect)


### Name: recover
### Title: Recover a causal effect from selection bias
### Aliases: recover

### ** Examples

library(igraph)

# We set simplify = FALSE to allow multiple edges.
g <- graph.formula(W_1 -+ X, W_2 -+ X, X -+ Y, # Observed edges
  W_2 -+ S, # The selection variable S
  W_1 -+ W_2, W_2 -+ W_1, W_1 -+ Y, Y -+ W_1, simplify = FALSE)

# Here the bidirected edges are set to be unobserved in the selection diagram d.
# This is denoted by giving them a description attribute with the value "U".
# The first five edges are observed, the rest are unobserved.
g <- set.edge.attribute(g, "description", 5:8, "U")

# The variable "S" is a selection variable. This is denoted by giving it
# a description attribute with the value "S".
g <- set.vertex.attribute(g, "description", 5, "S")

recover(y = "Y", x = "X", G = g)




