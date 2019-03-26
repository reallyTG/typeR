library(DiagrammeR)


### Name: count_loop_edges
### Title: Get count of all loop edges
### Aliases: count_loop_edges

### ** Examples

# Create an undirected, full graph
# with 3 nodes and all possible
# edges, including loop edges
graph <-
  create_graph(
    directed = FALSE) %>%
  add_full_graph(
    n = 3,
    keep_loops = TRUE)

# Get a count of all loop edges
# in the graph
graph %>%
  count_loop_edges()



