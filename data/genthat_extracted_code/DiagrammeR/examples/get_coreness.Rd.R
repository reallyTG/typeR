library(DiagrammeR)


### Name: get_coreness
### Title: Get coreness values for graph nodes
### Aliases: get_coreness

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

# Get coreness values for
# all nodes in the graph
graph %>%
  get_coreness()

# Add the coreness values
# to the graph as a node
# attribute
graph <-
  graph %>%
  join_node_attrs(
    df = get_coreness(.))

# Display the graph's node data frame
graph %>%
  get_node_df()



