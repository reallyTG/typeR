library(igraph)


### Name: delete_vertex_attr
### Title: Delete a vertex attribute
### Aliases: delete_vertex_attr remove.vertex.attribute

### ** Examples

g <- make_ring(10) %>%
  set_vertex_attr("name", value = LETTERS[1:10])
vertex_attr_names(g)
g2 <- delete_vertex_attr(g, "name")
vertex_attr_names(g2)



