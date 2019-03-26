library(DiagrammeR)


### Name: nudge_node_positions_ws
### Title: Move layout positions of a selection of nodes
### Aliases: nudge_node_positions_ws

### ** Examples

# Create a simple graph with 4 nodes
graph <-
  create_graph() %>%
  add_node(
    type = "a",
    label = "one") %>%
  add_node(
    type = "a",
    label = "two") %>%
  add_node(
    type = "b",
    label = "three") %>%
  add_node(
    type = "b",
    label = "four")

# Add position information to each of
# the graph's nodes
graph <-
  graph %>%
  set_node_position(
    node = 1, x = 1, y = 1) %>%
  set_node_position(
    node = 2, x = 2, y = 2) %>%
  set_node_position(
    node = 3, x = 3, y = 3) %>%
  set_node_position(
    node = 4, x = 4, y = 4)

# Select all of the graph's nodes using the
# `select_nodes()` function (and only
# specifying the graph object)
graph <- select_nodes(graph)

# Move the selected nodes (all the nodes,
# in this case) 5 units to the right
graph <-
  graph %>%
  nudge_node_positions_ws(
    dx = 5, dy = 0)

# View the graph's node data frame
graph %>%
  get_node_df()

# Now select nodes that have `type == "b"`
# and move them in the `y` direction 2 units
# (the graph still has an active selection
# and so it must be cleared first)
graph <-
  graph %>%
  clear_selection() %>%
  select_nodes(
    conditions = type == "b") %>%
  nudge_node_positions_ws(
    dx = 0, dy = 2)

# View the graph's node data frame
graph %>%
  get_node_df()



