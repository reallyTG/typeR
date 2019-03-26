library(DiagrammeR)


### Name: trigger_graph_actions
### Title: Trigger the execution of a series of graph actions
### Aliases: trigger_graph_actions

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 5,
    m = 10,
    set_seed = 23)

# Add a graph action that sets a node
# attr column with a function; this
# uses the `get_pagerank()` function
# to provide PageRank values in the
# `pagerank` column
graph <-
  graph %>%
  add_graph_action(
    fcn = "set_node_attr_w_fcn",
    node_attr_fcn = "get_pagerank",
    column_name = "pagerank",
    action_name = "get_pagerank")

# Add a second graph action (to be
# executed after the first one) that
# rescales values in the `pagerank`
# column between 0 and 1, and, puts
# these values in the `width` column
graph <-
  graph %>%
  add_graph_action(
    fcn = "rescale_node_attrs",
    node_attr_from = "pagerank",
    node_attr_to = "width",
    action_name = "pgrnk_to_width")

# Add a third and final graph action
# (to be executed last) that creates
# color values in the `fillcolor` column,
# based on the numeric values from the
# `width` column
graph <-
  graph %>%
  add_graph_action(
    fcn = "colorize_node_attrs",
    node_attr_from = "width",
    node_attr_to = "fillcolor",
    action_name = "pgrnk_fillcolor")

# View the graph actions for the graph
# object by using the `get_graph_actions()`
# function
graph %>%
  get_graph_actions()

# Manually trigger to invocation of
# the graph actions using the
# `trigger_graph_actions()` function
graph <-
  graph %>%
  trigger_graph_actions()

# Examine the graph's internal node
# data frame (ndf) to verify that
# the `pagerank`, `width`, and
# `fillcolor` columns are present
graph %>%
  get_node_df()



