library(DiagrammeR)


### Name: trav_both_edge
### Title: Traverse from one or more selected nodes onto adjacent edges
### Aliases: trav_both_edge

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
df <-
  data.frame(
    from = c(1, 1, 2, 2, 3),
    to = c(2, 3, 4, 5, 5),
    values = round(rnorm(5, 5), 2))

# Join the data frame to the graph's internal
# edge data frame (edf)
graph <-
  graph %>%
  join_edge_attrs(df = df)

# Show the graph's internal edge data frame
graph %>%
  get_edge_df()

# Perform a simple traversal from nodes to
# adjacent edges with no conditions on the
# nodes traversed to
graph %>%
  select_nodes_by_id(nodes = 3) %>%
  trav_both_edge() %>%
  get_selection()

# Traverse from node `2` to any adjacent
# edges, filtering to those edges that have
# NA values for the `rel` edge attribute
graph %>%
  select_nodes_by_id(nodes = 2) %>%
  trav_both_edge(
    conditions = is.na(rel)) %>%
  get_selection()

# Traverse from node `2` to any adjacent
# edges, filtering to those edges that have
# numeric values greater than `6.5` for
# the `rel` edge attribute
graph %>%
  select_nodes_by_id(nodes = 2) %>%
  trav_both_edge(
    conditions = values > 6.5) %>%
  get_selection()

# Traverse from node `5` to any adjacent
# edges, filtering to those edges that
# have values equal to `C` for the `rel`
# edge attribute
graph %>%
  select_nodes_by_id(nodes = 5) %>%
  trav_both_edge(
    conditions = rel == "C") %>%
  get_selection()

# Traverse from node `2` to any adjacent
# edges, filtering to those edges that
# have values in the set `B` and `C` for
# the `rel` edge attribute
graph %>%
  select_nodes_by_id(nodes = 2) %>%
  trav_both_edge(
    conditions = rel %in% c("B", "C")) %>%
  get_selection()

# Traverse from node `2` to any adjacent
# edges, and use multiple conditions for the
# traversal
graph %>%
  select_nodes_by_id(nodes = 2) %>%
  trav_both_edge(
    conditions =
      rel %in% c("B", "C") &
      values > 4.0) %>%
  get_selection()

# Traverse from node `2` to any adjacent
# edges, and use multiple conditions with
# a single-length vector
graph %>%
  select_nodes_by_id(nodes = 2) %>%
  trav_both_edge(
    conditions =
      rel %in% c("B", "C") |
      values > 4.0) %>%
  get_selection()

# Traverse from node `2` to any adjacent
# edges, and use a regular expression as
# a filtering condition
graph %>%
  select_nodes_by_id(nodes = 2) %>%
  trav_both_edge(
    conditions = grepl("B|C", rel)) %>%
  get_selection()

# Create another simple graph to demonstrate
# copying of node attribute values to traversed
# edges
graph <-
  create_graph() %>%
  add_path(n = 4) %>%
  select_nodes_by_id(nodes = 2:3) %>%
  set_node_attrs_ws(
    node_attr = value,
    value = 5)

# Show the graph's internal edge data frame
graph %>%
  get_edge_df()

# Show the graph's internal node data frame
graph %>%
  get_node_df()

# Perform a traversal from the nodes to
# the adjacent edges while also applying
# the node attribute `value` to the edges (in
# this case summing the `value` of 5 from
# all contributing nodes adding as an edge
# attribute)
graph <-
  graph %>%
  trav_both_edge(
    copy_attrs_from = value,
    agg = "sum")

# Show the graph's internal edge data frame
# after this change
graph %>%
  get_edge_df()



