library(igraph)


### Name: delete_graph_attr
### Title: Delete a graph attribute
### Aliases: delete_graph_attr remove.graph.attribute

### ** Examples

g <- make_ring(10)
graph_attr_names(g)
g2 <- delete_graph_attr(g, "name")
graph_attr_names(g2)



