library(causaleffect)


### Name: get.expression
### Title: Get the expression of a probability object
### Aliases: get.expression

### ** Examples

library(igraph)

# simplify = FALSE to allow multiple edges
g <- graph.formula(X -+ Y, Z -+ X, Z -+ Y , X -+ Z, Z -+ X, simplify = FALSE) 

# Here the bidirected edge between X and Z is set to be unobserved in graph g
# This is denoted by giving them a description attribute with the value "U"
# The edges in question are the fourth and the fifth edge
g <- set.edge.attribute(graph = g, name = "description", index = c(4,5), value = "U") 

x <- causal.effect(y = "Y", x = "X", z = NULL, G = g, expr = FALSE)
get.expression(x, primes = FALSE)
get.expression(x, primes = TRUE)



