library(igraph)


### Name: edge_attr_names
### Title: List names of edge attributes
### Aliases: edge_attr_names list.edge.attributes

### ** Examples

g <- make_ring(10) %>%
  set_edge_attr("label", value = letters[1:10])
edge_attr_names(g)
plot(g)



