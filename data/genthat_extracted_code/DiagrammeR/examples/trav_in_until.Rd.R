library(DiagrammeR)


### Name: trav_in_until
### Title: Traverse inward node-by_node until stopping conditions are met
### Aliases: trav_in_until

### ** Examples

# Create a path graph and add
# values of 1 to 10 across the
# nodes from beginning to end;
# select the last path node
graph <-
  create_graph() %>%
  add_path(
    n = 10,
    node_data = node_data(
      value = 1:10)) %>%
  select_nodes_by_id(
    nodes = 10)

# Traverse inward, node-by-node
# until stopping at a node where
# the `value` attribute is 1
graph <-
  graph %>%
  trav_in_until(
    conditions =
      value == 1)

# Get the graph's node selection
graph %>%
  get_selection()

# Create two cycles in a graph and
# add values of 1 to 6 to the
# first cycle, and values 7 to
# 12 in the second; select nodes
# `6` and `12`
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
    nodes = c(6, 12))

# Traverse inward, node-by-node
# from `6` and `12` until stopping
# at the first nodes where the
# `value` attribute is 1, 2, or 10;
# specify that we should only
# keep the finally traversed to
# nodes that satisfy the conditions
graph <-
  graph %>%
  trav_in_until(
    conditions =
      value %in% c(1, 2, 10),
    exclude_unmatched = TRUE)

# Get the graph's node selection
graph %>%
  get_selection()



