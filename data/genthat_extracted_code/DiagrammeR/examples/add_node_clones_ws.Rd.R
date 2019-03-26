library(DiagrammeR)


### Name: add_node_clones_ws
### Title: Add clones of a selection of nodes
### Aliases: add_node_clones_ws

### ** Examples

# Create a graph with a path of
# nodes; supply `label`, `type`,
# and `value` node attributes,
# and select the created nodes
graph <-
  create_graph() %>%
  add_path(
    n = 3,
    label = c("d", "g", "r"),
    type = c("a", "b", "c")) %>%
  select_last_nodes_created()

# Display the graph's internal
# node data frame
graph %>%
  get_node_df()

# Create clones of all nodes
# in the selection but assign
# new node label values
# (leaving `label` as NULL
# yields NA values)
graph <-
  graph %>%
  add_node_clones_ws(
    label = c("a", "b", "v"))

# Display the graph's internal
# node data frame: nodes `4`,
# `5`, and `6` are clones of
# `1`, `2`, and `3`
graph %>%
  get_node_df()

# Select the last nodes
# created (`4`, `5`, and `6`)
# and clone those nodes and
# their attributes while
# creating new edges between
# the new and existing nodes
graph <-
  graph %>%
  select_last_nodes_created() %>%
  add_node_clones_ws(
    add_edges = TRUE,
    direction = "to",
    label = c("t", "z", "s"))

# Display the graph's internal
# edge data frame; there are
# edges between the selected
# nodes and their clones
graph %>%
  get_edge_df()



