library(DiagrammeR)


### Name: get_eigen_centrality
### Title: Get the eigen centrality for all nodes
### Aliases: get_eigen_centrality

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph(
    directed = FALSE) %>%
  add_gnm_graph(
    n = 10, m = 15,
    set_seed = 23)

# Get the eigen centrality scores
# for nodes in the graph
graph %>%
  get_eigen_centrality()



