library(DiagrammeR)


### Name: trav_out
### Title: Traverse from one or more selected nodes onto adjacent, outward
###   nodes
### Aliases: trav_out

### ** Examples

# Set a seed
set.seed(23)

# Create a simple graph
graph <-
  create_graph() %>%
  add_n_nodes(
    n = 2,
    type = "a",
    label = c("asd", "iekd")) %>%
  add_n_nodes(
    n = 3,
    type = "b",
    label = c("idj", "edl", "ohd")) %>%
  add_edges_w_string(
    edges = "1->2 1->3 2->4 2->5 3->5",
    rel = c(NA, "A", "B", "C", "D"))

# Create a data frame with node ID values
# representing the graph edges (with `from`
# and `to` columns), and, a set of numeric values
df_edges <-
  data.frame(
    from = c(1, 1, 2, 2, 3),
    to = c(2, 3, 4, 5, 5),
    values = round(rnorm(5, 5), 2))

# Create a data frame with node ID values
# representing the graph nodes (with the `id`
# columns), and, a set of numeric values
df_nodes <-
  data.frame(
    id = 1:5,
    values = round(rnorm(5, 7), 2))

# Join the data frame to the graph's internal
# edge data frame (edf)
graph <-
  graph %>%
  join_edge_attrs(df = df_edges) %>%
  join_node_attrs(df = df_nodes)

# Show the graph's internal node data frame
graph %>%
  get_node_df()

# Show the graph's internal edge data frame
graph %>%
  get_edge_df()

# Perform a simple traversal from node `3`
# to outward adjacent nodes with no conditions
# on the nodes traversed to
graph %>%
  select_nodes_by_id(nodes = 3) %>%
  trav_out() %>%
  get_selection()

# Traverse from node `1` to outbound
# nodes, filtering to those nodes that have
# numeric values greater than `7.0` for
# the `values` node attribute
graph %>%
  select_nodes_by_id(nodes = 1) %>%
  trav_out(
    conditions = values > 7.0) %>%
  get_selection()

# Traverse from node `1` to any outbound
# nodes, filtering to those nodes that
# have a `type` attribute of `b`
graph %>%
  select_nodes_by_id(nodes = 1) %>%
  trav_out(
    conditions = type == "b") %>%
  get_selection()

# Traverse from node `2` to any outbound
# nodes, filtering to those nodes that
# have a degree of `1`
graph %>%
  {
  node_degrees <-
    get_node_info(.) %>%
    dplyr::select(id, deg)
  join_node_attrs(
    graph = .,
    df = node_degrees)
  } %>%
  select_nodes_by_id(nodes = 2) %>%
  trav_out(
    conditions = deg == 1) %>%
  get_selection()

# Traverse from node `2` to any outbound
# nodes, and use multiple conditions for
# the traversal
graph %>%
  select_nodes_by_id(nodes = 2) %>%
  trav_out(
    conditions =
      type == "a" &
      values > 8.0) %>%
  get_selection()

# Traverse from node `2` to any
# outbound nodes, and use multiple
# conditions with a single-length vector
graph %>%
  select_nodes_by_id(nodes = 2) %>%
  trav_out(
    conditions =
      type == "b" |
      values > 8.0) %>%
  get_selection()

# Traverse from node `2` to any outbound
# nodes, and use a regular expression as
# a filtering condition
graph %>%
  select_nodes_by_id(nodes = 2) %>%
  trav_out(
    conditions = grepl("..d", label)) %>%
  get_selection()

# Create another simple graph to demonstrate
# copying of node attribute values to traversed
# nodes
graph <-
  create_graph() %>%
  add_node() %>%
  select_nodes() %>%
  add_n_nodes_ws(
    n = 2,
    direction = "to") %>%
  clear_selection() %>%
  select_nodes_by_id(nodes = 2:3) %>%
  set_node_attrs_ws(
    node_attr = value,
    value = 5)

# Show the graph's internal node data frame
graph %>%
  get_node_df()

# Show the graph's internal edge data frame
graph %>%
  get_edge_df()

# Perform a traversal from the outer nodes
# (`2` and `3`) to the central node (`1`) while
# also applying the node attribute `value` to
# node `1` (summing the `value` of 5 from
# both nodes before applying that value to the
# target node)
graph <-
  graph %>%
  trav_out(
    copy_attrs_from = value,
    agg = "sum")

# Show the graph's internal node data
# frame after this change
graph %>%
  get_node_df()



