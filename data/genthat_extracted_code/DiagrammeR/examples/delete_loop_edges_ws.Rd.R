library(DiagrammeR)


### Name: delete_loop_edges_ws
### Title: Delete all loop edges associated with a selection of nodes
### Aliases: delete_loop_edges_ws

### ** Examples

# Create an undirected, full graph
# of 5 nodes with loops retained
graph <-
  create_graph(
    directed = FALSE) %>%
  add_full_graph(
    n = 5,
    keep_loops = TRUE)

# Select nodes `3` and `4`
# and remove the loop edges
# associated with those nodes
graph <-
  graph %>%
  select_nodes_by_id(
    nodes = 3:4) %>%
  delete_loop_edges_ws()

# Count the number of loop
# edges remaining in the graph
graph %>%
  count_loop_edges()



