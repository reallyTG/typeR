library(DiagrammeR)


### Name: get_radiality
### Title: Get radiality centrality scores
### Aliases: get_radiality

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 10,
    m = 15,
    set_seed = 23)

# Get the radiality scores for nodes in the graph
graph %>%
  get_radiality()

# Add the radiality values
# to the graph as a node
# attribute
graph <-
  graph %>%
  join_node_attrs(
    df = get_radiality(.))

# Display the graph's node data frame
graph %>%
  get_node_df()



