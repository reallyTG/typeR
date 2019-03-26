library(DiagrammeR)


### Name: get_leverage_centrality
### Title: Get leverage centrality
### Aliases: get_leverage_centrality

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph(
    directed = FALSE) %>%
  add_gnm_graph(
    n = 10,
    m = 15,
    set_seed = 23)

# Get leverage centrality values
# for all nodes in the graph
graph %>%
  get_leverage_centrality()

# Add the leverage centrality
# values to the graph as a
# node attribute
graph <-
  graph %>%
  join_node_attrs(
    df = get_leverage_centrality(.))

# Display the graph's node data frame
graph %>%
  get_node_df()



