library(igraph)


### Name: add_edges
### Title: Add edges to a graph
### Aliases: add_edges add.edges

### ** Examples

g <- make_empty_graph(n = 5) %>%
  add_edges(c(1,2, 2,3, 3,4, 4,5)) %>%
  set_edge_attr("color", value = "red") %>%
  add_edges(c(5,1), color = "green")
E(g)[[]]
plot(g)



