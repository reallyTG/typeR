library(igraph)


### Name: edge
### Title: Helper function for adding and deleting edges
### Aliases: edge edges

### ** Examples

g <- make_ring(10) %>%
  set_edge_attr("color", value = "red")

g <- g + edge(1, 5, color = "green") +
  edge(2, 6, color = "blue") -
  edge("8|9")

E(g)[[]]

g %>%
  add_layout_(in_circle()) %>%
  plot()

g <- make_ring(10) + edges(1:10)
plot(g)



