library(causaleffect)


### Name: transport
### Title: Derive a transport formula for a causal effect between two
###   domains
### Aliases: transport

### ** Examples

library(igraph)

# We set simplify = FALSE to allow multiple edges.
d <- graph.formula(X -+ Z, Z -+ W, W -+ V, V -+ Y, S -+ V, # Observed edges
  X -+ Z, Z -+ X, V -+ Y, Y -+ V, X -+ Y, Y -+ X, simplify = FALSE)

# Here the bidirected edges are set to be unobserved in the selection diagram d.
# This is denoted by giving them a description attribute with the value "U".
# The first five edges are observed, the rest are unobserved.
d <- set.edge.attribute(d, "description", 6:11, "U")

# The variable "S" is a selection variable. This is denoted by giving it
# a description attribute with the value "S". 
d <- set.vertex.attribute(d, "description", 6, "S")

transport(y = "Y", x = "X", D = d)





