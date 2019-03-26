library(igraph)


### Name: igraph-vs-indexing2
### Title: Select vertices and show their metadata
### Aliases: igraph-vs-indexing2 [[.igraph.vs

### ** Examples

g <- make_ring(10) %>%
  set_vertex_attr("color", value = "red") %>%
  set_vertex_attr("name", value = LETTERS[1:10])
V(g)
V(g)[[]]
V(g)[1:5]
V(g)[[1:5]]



