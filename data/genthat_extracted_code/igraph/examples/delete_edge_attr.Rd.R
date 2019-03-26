library(igraph)


### Name: delete_edge_attr
### Title: Delete an edge attribute
### Aliases: delete_edge_attr remove.edge.attribute

### ** Examples

g <- make_ring(10) %>%
  set_edge_attr("name", value = LETTERS[1:10])
edge_attr_names(g)
g2 <- delete_edge_attr(g, "name")
edge_attr_names(g2)



