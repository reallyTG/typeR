library(DiagrammeR)


### Name: get_bridging
### Title: Get bridging scores
### Aliases: get_bridging

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 10,
    m = 12,
    set_seed = 23)

# Get the bridging scores for nodes
# in the graph
graph %>%
  get_bridging()

# Add the bridging scores to
# the graph as a node attribute
graph <-
  graph %>%
  join_node_attrs(
    df = get_bridging(.))

# Display the graph's node data frame
graph %>%
  get_node_df()



