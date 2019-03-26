library(igraph)


### Name: vertex_attr_names
### Title: List names of vertex attributes
### Aliases: vertex_attr_names list.vertex.attributes

### ** Examples

g <- make_ring(10) %>%
  set_vertex_attr("name", value = LETTERS[1:10]) %>%
  set_vertex_attr("color", value = rep("green", 10))
vertex_attr_names(g)
plot(g)



