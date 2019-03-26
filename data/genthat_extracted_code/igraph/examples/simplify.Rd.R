library(igraph)


### Name: simplify
### Title: Simple graphs
### Aliases: simplify is.simple is_simple is_simple
### Keywords: graphs

### ** Examples


g <- graph( c(1,2,1,2,3,3) )
is_simple(g)
is_simple(simplify(g, remove.loops=FALSE))
is_simple(simplify(g, remove.multiple=FALSE))
is_simple(simplify(g))



