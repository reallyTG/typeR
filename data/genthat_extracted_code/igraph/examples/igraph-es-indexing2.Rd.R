library(igraph)


### Name: igraph-es-indexing2
### Title: Select edges and show their metadata
### Aliases: igraph-es-indexing2 [[.igraph.es

### ** Examples

g <- make_(ring(10),
  with_vertex_(name = LETTERS[1:10]),
  with_edge_(weight = 1:10, color = "green"))
E(g)
E(g)[[]]
E(g)[[.inc('A')]]



