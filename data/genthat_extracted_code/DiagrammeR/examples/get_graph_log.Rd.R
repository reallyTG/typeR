library(DiagrammeR)


### Name: get_graph_log
### Title: Get the graph log information
### Aliases: get_graph_log

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function and
# delete 2 nodes from the graph
graph <-
  create_graph(
    directed = FALSE) %>%
  add_gnm_graph(
    n = 10,
    m = 15,
    set_seed = 23) %>%
  delete_node(node = 5) %>%
  delete_node(node = 7)

# Get the graph log, which is a
# record of all graph transformations
graph %>%
  get_graph_log()



