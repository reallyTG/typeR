library(causaleffect)


### Name: meta.transport
### Title: Derive a transport formula for a causal effect between a target
###   domain and multiple source domains
### Aliases: meta.transport

### ** Examples

library(igraph)

# Selection diagram corresponding to the first source domain.
# We set simplify = FALSE to allow multiple edges.
d1 <- graph.formula(X -+ Z, W_1 -+ W_2, W_2 -+ Z, 
  W_3 -+ Z, X -+ W_3, W_2 -+ X, Z -+ Y, # Observed edges
  S_1 -+ X, S_2 -+ W_2, S_3 -+ W_3, S_4 -+ Y, # Edges related to selection variables
  X -+ W_3, W_3 -+ X, X -+ W_2, W_2 -+ X, X -+ W_1, 
  W_1 -+ X, W_1 -+ Z, Z -+ W_1, simplify = FALSE)

# Here the bidirected edges are set to be unobserved in the selection diagram d1.
# This is denoted by giving them a description attribute with the value "U".
# The first 7 edges are observed and the next 4 are related to the selection variables.
# The rest of the edges are unobserved.
d1 <- set.edge.attribute(d1, "description", 12:19, "U")

# The variables "S_1", "S_2", "S_3" and "S_4" are selection variables.
# This is denoted by giving them a description attribute with the value "S".
d1 <- set.vertex.attribute(d1, "description", 7:10, "S")

# Selection diagram corresponding to the second 
# source domain is constructed in a similar fashion.
d2 <- graph.formula(X -+ Z, W_1 -+ W_2, W_2 -+ Z, W_3 -+ Z, 
 X -+ W_3, W_2 -+ X, Z -+ Y, # Observed edges
 S_1 -+ X, S_2 -+ W_2, S_3 -+ W_1, 
 S_4 -+ Y, S_5 -+ Z, # Edges related to selection variables
 X -+ W_3, W_3 -+ X, X -+ W_2, W_2 -+ X, X -+ W_1, 
 W_1 -+ X, W_1 -+ Z, Z -+ W_1, simplify = FALSE)
d2 <- set.edge.attribute(d2, "description", 13:20, "U")
d2 <- set.vertex.attribute(d2, "description", 7:11, "S")

# We combine the diagrams as a list.
d.comb <- list(d1, d2)
meta.transport(y = "Y", x = "X", D = d.comb)



