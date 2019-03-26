library(igraph)


### Name: V
### Title: Vertices of a graph
### Aliases: V

### ** Examples

# Vertex ids of an unnamed graph
g <- make_ring(10)
V(g)

# Vertex ids of a named graph
g2 <- make_ring(10) %>%
  set_vertex_attr("name", value = letters[1:10])
V(g2)



