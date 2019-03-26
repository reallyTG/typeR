library(igraph)


### Name: is_named
### Title: Named graphs
### Aliases: is_named is.named
### Keywords: graphs

### ** Examples


g <- make_ring(10)
is_named(g)
V(g)$name <- letters[1:10]
is_named(g)
neighbors(g, "a")




