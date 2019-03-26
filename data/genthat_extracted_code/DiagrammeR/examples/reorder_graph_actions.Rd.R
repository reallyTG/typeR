library(DiagrammeR)


### Name: reorder_graph_actions
### Title: Trigger the execution of a series of graph actions
### Aliases: reorder_graph_actions

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 4,
    m = 4,
    set_seed = 23)

# Add three graph actions to the
# graph
graph <-
  graph %>%
  add_graph_action(
    fcn = "rescale_node_attrs",
    node_attr_from = "pagerank",
    node_attr_to = "width",
    action_name = "pgrnk_to_width") %>%
  add_graph_action(
    fcn = "set_node_attr_w_fcn",
    node_attr_fcn = "get_pagerank",
    column_name = "pagerank",
    action_name = "get_pagerank") %>%
  add_graph_action(
    fcn = "colorize_node_attrs",
    node_attr_from = "width",
    node_attr_to = "fillcolor",
    action_name = "pgrnk_fillcolor")

# View the graph actions for the graph
# object by using the function called
# `get_graph_actions()`
graph %>%
  get_graph_actions()

# We note that the order isn't
# correct and that the `get_pagerank`
# action should be the 1st action
# and `pgrnk_to_width` should go
# in 2nd place; to fix this, use the
# function `reorder_graph_actions()`
# and specify the reordering with a
# numeric vector
graph <-
  graph %>%
  reorder_graph_actions(
    indices = c(2, 1, 3))

# View the graph actions for the graph
# object once again to verify that
# we have the desired order of actions
graph %>%
  get_graph_actions()



