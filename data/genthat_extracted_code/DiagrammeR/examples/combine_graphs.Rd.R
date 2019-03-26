library(DiagrammeR)


### Name: combine_graphs
### Title: Combine two graphs into a single graph
### Aliases: combine_graphs

### ** Examples

# Create a graph with a cycle
# containing 6 nodes
graph_cycle <-
 create_graph() %>%
   add_cycle(n = 6)

# Create a random graph with
# 8 nodes and 15 edges using the
# `add_gnm_graph()` function
graph_random <-
  create_graph() %>%
  add_gnm_graph(
    n = 8,
    m = 15,
    set_seed = 23)

# Combine the two graphs in a
# union operation
combined_graph <-
  combine_graphs(
    graph_cycle,
    graph_random)

# Get the number of nodes in
# the combined graph
combined_graph %>%
  count_nodes()

# The `combine_graphs()`
# function will renumber
# node ID values in graph `y`
# during the union; this ensures
# that node ID values are unique
combined_graph %>%
  get_node_ids()



