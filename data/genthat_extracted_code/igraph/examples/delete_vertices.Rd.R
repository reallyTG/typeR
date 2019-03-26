library(igraph)


### Name: delete_vertices
### Title: Delete vertices from a graph
### Aliases: delete_vertices delete.vertices

### ** Examples

g <- make_ring(10) %>%
  set_vertex_attr("name", value = LETTERS[1:10])
g
V(g)

g2 <- delete_vertices(g, c(1,5)) %>%
  delete_vertices("B")
g2
V(g2)



