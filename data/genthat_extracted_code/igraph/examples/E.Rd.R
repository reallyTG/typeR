library(igraph)


### Name: E
### Title: Edges of a graph
### Aliases: E

### ** Examples

# Edges of an unnamed graph
g <- make_ring(10)
E(g)

# Edges of a named graph
g2 <- make_ring(10) %>%
  set_vertex_attr("name", value = letters[1:10])
E(g2)



