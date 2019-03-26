library(DiagrammeR)


### Name: rev_edge_dir
### Title: Reverse the direction of all edges in a graph
### Aliases: rev_edge_dir

### ** Examples

# Create a graph with a
# directed tree
graph <-
  create_graph() %>%
  add_balanced_tree(
    k = 2, h = 2)

# Inspect the graph's edges
graph %>%
  get_edges()

# Reverse the edge directions
# such that edges are directed
# toward the root of the tree
graph <-
  graph %>%
  rev_edge_dir()

# Inspect the graph's edges
# after their reversal
graph %>%
  get_edges()



