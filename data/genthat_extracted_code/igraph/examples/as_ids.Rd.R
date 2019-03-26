library(igraph)


### Name: as_ids
### Title: Convert a vertex or edge sequence to an ordinary vector
### Aliases: as_ids as_ids.igraph.vs as_ids.igraph.es

### ** Examples

g <- make_ring(10)
as_ids(V(g))
as_ids(E(g))

V(g)$name <- letters[1:10]
as_ids(V(g))
as_ids(E(g))



