library(DiagrammeR)


### Name: is_graph_directed
### Title: Is the graph a directed graph?
### Aliases: is_graph_directed

### ** Examples

# Create an empty graph; by default,
# new graphs made by `create_graph()`
# are directed
graph <-
  create_graph()

# Determine whether the graph
# is directed
graph %>%
  is_graph_directed()

# Use the `set_graph_undirected()`
# function and check again whether
# the graph is directed
graph %>%
  set_graph_undirected() %>%
  is_graph_directed()



