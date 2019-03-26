library(DiagrammeR)


### Name: set_graph_directed
### Title: Convert an undirected graph to a directed graph
### Aliases: set_graph_directed

### ** Examples

# Create a graph with a
# undirected tree
graph <-
  create_graph(
    directed = FALSE) %>%
  add_balanced_tree(
    k = 2, h = 2)

# Convert this graph from
# undirected to directed
graph <-
  graph %>%
  set_graph_directed()

# Perform a check on whether
# graph is directed
graph %>%
  is_graph_directed()



