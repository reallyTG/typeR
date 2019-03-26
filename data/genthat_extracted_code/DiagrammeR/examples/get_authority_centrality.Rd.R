library(DiagrammeR)


### Name: get_authority_centrality
### Title: Get the authority scores for all nodes
### Aliases: get_authority_centrality

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 10,
    m = 15,
    set_seed = 23)

# Get the authority centrality scores
# for all nodes in the graph
graph %>%
  get_authority_centrality()

# Add the authority centrality
# scores to the graph as a node
# attribute
graph <-
  graph %>%
  join_node_attrs(
    df = get_authority_centrality(.))

# Display the graph's node data frame
graph %>%
  get_node_df()



