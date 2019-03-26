library(igraph)


### Name: vertex_attr
### Title: Query vertex attributes of a graph
### Aliases: vertex_attr get.vertex.attribute vertex.attributes

### ** Examples

g <- make_ring(10) %>%
  set_vertex_attr("color", value = "red") %>%
  set_vertex_attr("label", value = letters[1:10])
vertex_attr(g, "label")
vertex_attr(g)
plot(g)



