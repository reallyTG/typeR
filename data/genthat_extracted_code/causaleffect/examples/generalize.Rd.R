library(causaleffect)


### Name: generalize
### Title: Derive a transport formula for a causal effect between a target
###   domain and multiple source domains with limited experiments
### Aliases: generalize

### ** Examples

library(igraph)

# Selection diagram corresponding to the target domain (no selection variables).
# We set simplify = FALSE to allow multiple edges.
d1 <-  graph.formula(Z_1 -+ X, Z_2 -+ X, X -+ Z_3, Z_3 -+ W,
 Z_3 -+ U, U -+ Y, W -+ U, Z_1 -+ Z_3, # Observed edges
 Z_1 -+ Z_2, Z_2 -+ Z_1, Z_1 -+ X, X -+ Z_1,
 Z_2 -+ Z_3, Z_3 -+ Z_2, Z_2 -+ U, U -+ Z_2,
 W -+ Y, Y -+ W, simplify = FALSE)

# Here the bidirected edges are set to be unobserved in the selection diagram d1.
# This is denoted by giving them a description attribute with the value "U".
# The first 8 edges are observed and the next 10 are unobserved.
d1 <- set.edge.attribute(d1, "description", 9:18, "U")

# We can use the causal diagram d1 to create selection diagrams 
# for two source domains, a and b.
d1a <- union(d1, graph.formula(S_1 -+ Z_2, S_2 -+ Z_3, S_3 -+ W))

# The variables "S_1", "S_2", and "S_3" are selection variables.
# This is denoted by giving them a description attribute with the value "S".
# The graph already has 7 vertices, so the last three depict the new ones.
d1a <- set.vertex.attribute(d1a, "description", 8:10, "S")

# Selection diagram corresponding to the second 
# source domain is constructed in a similar fashion.
d1b <- union(d1, graph.formula(S_1 -+ Z_1, S_2 -+ W, S_3 -+ U))
d1b <- set.vertex.attribute(d1b, "description", 8:10, "S")

# We combine the diagrams as a list.
d.comb <- list(d1, d1a, d1b)

# We still need the available experiments at each domain.
z <- list(c("Z_1"), c("Z_2"), c("Z_1"))
# This denotes that the variable "Z_1" is available for intervention 
# in both the target domain, and the second source domain. 
# The variable "Z_2" is available for intervention in the first source domain.

generalize(y = "Y", x = "X", Z = z, D = d.comb)



