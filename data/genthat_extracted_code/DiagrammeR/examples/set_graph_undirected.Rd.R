library(DiagrammeR)


### Name: set_graph_undirected
### Title: Convert a directed graph to an undirected graph
### Aliases: set_graph_undirected

### ** Examples

# Create a graph with a
# directed tree
graph <-
  create_graph() %>%
  add_balanced_tree(
    k = 2, h = 2)

# Convert this graph from
# directed to undirected
graph <-
  graph %>%
  set_graph_undirected()

# Perform a check on whether
# graph is directed
graph %>%
  is_graph_directed()



