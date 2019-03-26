library(DiagrammeR)


### Name: is_graph_weighted
### Title: Is the graph a weighted graph?
### Aliases: is_graph_weighted

### ** Examples

# Create a graph where the edges have
# a `weight` attribute
graph <-
  create_graph() %>%
  add_cycle(n = 5) %>%
  select_edges() %>%
  set_edge_attrs_ws(
    edge_attr = weight,
    value = c(3, 5, 2, 9, 6)) %>%
  clear_selection()

# Determine whether the graph
# is a weighted graph
graph %>%
  is_graph_weighted()

# Create graph where the edges do
# not have a `weight` attribute
graph <-
  create_graph() %>%
  add_cycle(n = 5)

# Determine whether this graph
# is weighted
graph %>%
  is_graph_weighted()



