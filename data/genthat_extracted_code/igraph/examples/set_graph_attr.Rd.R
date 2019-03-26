library(igraph)


### Name: set_graph_attr
### Title: Set a graph attribute
### Aliases: set_graph_attr set.graph.attribute

### ** Examples

g <- make_ring(10) %>%
  set_graph_attr("layout", layout_with_fr)
g
plot(g)



