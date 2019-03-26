library(igraph)


### Name: strength
### Title: Strength or weighted vertex degree
### Aliases: strength graph.strength
### Keywords: graphs

### ** Examples


g <- make_star(10)
E(g)$weight <- seq(ecount(g))
strength(g)
strength(g, mode="out")
strength(g, mode="in")

# No weights, a warning is given
g <- make_ring(10)
strength(g)



