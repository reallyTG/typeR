library(igraph)


### Name: add_vertices
### Title: Add vertices to a graph
### Aliases: add_vertices add.vertices

### ** Examples

g <- make_empty_graph() %>%
  add_vertices(3, color = "red") %>%
  add_vertices(2, color = "green") %>%
  add_edges(c(1,2, 2,3, 3,4, 4,5))
g
V(g)[[]]
plot(g)



