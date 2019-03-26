library(igraph)


### Name: set_vertex_attr
### Title: Set vertex attributes
### Aliases: set_vertex_attr set.vertex.attribute

### ** Examples

g <- make_ring(10) %>%
  set_vertex_attr("label", value = LETTERS[1:10])
g
plot(g)



