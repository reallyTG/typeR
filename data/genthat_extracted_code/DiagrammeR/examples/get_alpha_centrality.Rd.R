library(DiagrammeR)


### Name: get_alpha_centrality
### Title: Get the alpha centrality for all nodes
### Aliases: get_alpha_centrality

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 10,
    m = 12,
    set_seed = 23)

# Get the alpha centrality scores
# for all nodes
graph %>%
  get_alpha_centrality()

# Add the alpha centrality
# scores to the graph as a node
# attribute
graph <-
  graph %>%
  join_node_attrs(
    df = get_alpha_centrality(.))

# Display the graph's node
# data frame
graph %>%
  get_node_df()



