library(igraph)


### Name: edge_attr
### Title: Query edge attributes of a graph
### Aliases: edge_attr get.edge.attribute edge.attributes

### ** Examples

g <- make_ring(10) %>%
  set_edge_attr("weight", value = 1:10) %>%
  set_edge_attr("color", value = "red")
g
plot(g, edge.width = E(g)$weight)



