library(igraph)


### Name: set_edge_attr
### Title: Set edge attributes
### Aliases: set_edge_attr set.edge.attribute

### ** Examples

g <- make_ring(10) %>%
  set_edge_attr("label", value = LETTERS[1:10])
g
plot(g)



