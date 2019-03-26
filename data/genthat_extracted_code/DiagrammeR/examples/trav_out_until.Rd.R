library(DiagrammeR)


### Name: trav_out_until
### Title: Traverse outward node-by_node until stopping conditions are met
### Aliases: trav_out_until

### ** Examples

# Create a path graph and add
# values of 1 to 10 across the
# nodes from beginning to end;
# select the first path node
graph <-
  create_graph() %>%
  add_path(
    n = 10,
    node_data = node_data(
      value = 1:10)) %>%
  select_nodes_by_id(
    nodes = 1)

# Traverse outward, node-by-node
# until stopping at a node where
# the `value` attribute is 8
graph <-
  graph %>%
  trav_out_until(
    conditions =
      value == 8)

# Get the graph's node selection
graph %>%
  get_selection()

# Create two cycles in graph and
# add values of 1 to 6 to the
# first cycle, and values 7 to
# 12 in the second; select nodes
# `1` and `7`
graph <-
  create_graph() %>%
  add_cycle(
    n = 6,
    node_data = node_data(
      value = 1:6)) %>%
  add_cycle(
    n = 6,
    node_data = node_data(
      value = 7:12)) %>%
  select_nodes_by_id(
    nodes = c(1, 7))

# Traverse outward, node-by-node
# from `1` and `7` until stopping
# at the first nodes where the
# `value` attribute is 5, 6, or 15;
# specify that we should only
# keep the finally traversed to
# nodes that satisfy the conditions
graph <-
  graph %>%
  trav_out_until(
    conditions =
      value %in% c(5, 6, 9),
    exclude_unmatched = TRUE)

# Get the graph's node selection
graph %>%
  get_selection()



