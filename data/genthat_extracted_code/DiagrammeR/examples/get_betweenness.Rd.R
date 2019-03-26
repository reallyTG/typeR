library(DiagrammeR)


### Name: get_betweenness
### Title: Get betweenness centrality scores
### Aliases: get_betweenness

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 10,
    m = 12,
    set_seed = 23)

# Get the betweenness scores
# for nodes in the graph
graph %>%
  get_betweenness()

# Add the betweenness
# values to the graph
# as a node attribute
graph <-
  graph %>%
  join_node_attrs(
    df = get_betweenness(.))

# Display the graph's node
# data frame
graph %>%
  get_node_df()



