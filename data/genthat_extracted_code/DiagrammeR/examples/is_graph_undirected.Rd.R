library(DiagrammeR)


### Name: is_graph_undirected
### Title: Is the graph an undirected graph?
### Aliases: is_graph_undirected

### ** Examples

# Create an empty graph; by
# default, new graphs made
# by `create_graph()` are
# directed graph, so, use
# `directed = FALSE` to create
# an undirected graph
graph <-
  create_graph(
    directed = FALSE)

# Determine whether the
# graph is undirected
graph %>%
  is_graph_undirected()

# Use the `set_graph_directed()`
# function and check again
# as to whether the graph is
# undirected
graph %>%
  set_graph_directed() %>%
  is_graph_undirected()



