library(DiagrammeR)


### Name: get_graph_actions
### Title: Get information on any available graph actions
### Aliases: get_graph_actions

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

# Add a graph action that sets a node
# attr column with a function; the
# main function `set_node_attr_w_fcn()`
# uses the `get_betweenness()` function
# to provide betweenness values in the
# `btwns` column
graph <-
  graph %>%
  add_graph_action(
    fcn = "set_node_attr_w_fcn",
    node_attr_fcn = "get_betweenness",
    column_name = "btwns",
    action_name = "get_btwns")

# To ensure that the action is
# available in the graph, use the
# `get_graph_actions()` function
graph %>%
  get_graph_actions()



