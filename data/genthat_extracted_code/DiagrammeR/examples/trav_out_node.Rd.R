library(DiagrammeR)


### Name: trav_out_node
### Title: Traverse from one or more selected edges onto adjacent, outward
###   nodes
### Aliases: trav_out_node

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

# Perform a simple traversal from the
# edge `1`->`3` to the attached node
# in the direction of the edge; here, no
# conditions are placed on the nodes
# traversed to
graph %>%
  select_edges(
    from = 1,
      to = 3) %>%
  trav_out_node() %>%
  get_selection()

# Traverse from edges `2`->`5` and
# `3`->`5` to the attached node along
# the direction of the edge; here, the
# traversals lead to different nodes
graph %>%
  select_edges(
    from = 2,
      to = 5) %>%
  select_edges(
    from = 3,
      to = 5) %>%
  trav_out_node() %>%
  get_selection()

# Traverse from the edge `1`->`3`
# to the attached node where the edge
# is outgoing, this time filtering
# numeric values greater than `7.0` for
# the `values` node attribute
graph %>%
  select_edges(
    from = 1,
      to = 3) %>%
  trav_out_node(
    conditions = values > 7.0) %>%
  get_selection()

# Traverse from the edge `1`->`3`
# to the attached node where the edge
# is outgoing, this time filtering
# numeric values less than `7.0` for
# the `values` node attribute (the
# condition is not met so the original
# selection of edge `1`->`3` remains)
graph %>%
  select_edges(
    from = 1,
      to = 3) %>%
  trav_out_node(
    conditions = values < 7.0) %>%
  get_selection()

# Traverse from the edge `1`->`2`
# to node `2`, using multiple conditions
graph %>%
  select_edges(
    from = 1,
      to = 2) %>%
  trav_out_node(
    conditions =
      grepl(".*d$", label) |
      values < 6.0) %>%
  get_selection()

# Create another simple graph to demonstrate
# copying of edge attribute values to traversed
# nodes
graph <-
  create_graph() %>%
  add_node() %>%
  select_nodes() %>%
  add_n_nodes_ws(
    n = 2,
    direction = "from") %>%
  clear_selection() %>%
  select_nodes_by_id(nodes = 2) %>%
  set_node_attrs_ws(
    node_attr = value,
    value = 8) %>%
  clear_selection() %>%
  select_edges_by_edge_id(edges = 1) %>%
  set_edge_attrs_ws(
    edge_attr = value,
    value = 5) %>%
  clear_selection() %>%
  select_edges_by_edge_id(edges = 2) %>%
  set_edge_attrs_ws(
    edge_attr = value,
    value = 5) %>%
  clear_selection() %>%
  select_edges()

# Show the graph's internal edge data frame
graph %>%
  get_edge_df()

# Show the graph's internal node data frame
graph %>%
  get_node_df()

# Perform a traversal from the edges to
# the central node (`1`) while also applying
# the edge attribute `value` to the node (in
# this case summing the `value` of 5 from
# both edges before adding as a node attribute)
graph <-
  graph %>%
  trav_out_node(
    copy_attrs_from = value,
    agg = "sum")

# Show the graph's internal node data frame
# after this change
graph %>%
  get_node_df()



