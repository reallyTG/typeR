library(DiagrammeR)


### Name: trav_out_edge
### Title: Traverse from one or more selected nodes onto adjacent, outward
###   edges
### Aliases: trav_out_edge

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
    rel = c(NA, "A", "B", "C", "D")) %>%
  set_node_attrs(
    node_attr = values,
    values = c(2.3, 4.7, 9.4,
               8.3, 6.3))

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
  join_edge_attrs(
    df = df)

# Show the graph's internal node data frame
graph %>%
  get_node_df()

# Show the graph's internal edge data frame
graph %>%
  get_edge_df()

# Perform a simple traversal from nodes to
# outbound edges with no conditions on the
# nodes traversed to
graph %>%
  select_nodes_by_id(nodes = 1) %>%
  trav_out_edge() %>%
  get_selection()

# Traverse from node `1` to any outbound
# edges, filtering to those edges that have
# NA values for the `rel` edge attribute
graph %>%
  select_nodes_by_id(nodes = 1) %>%
  trav_out_edge(
    conditions = is.na(rel)) %>%
  get_selection()

# Traverse from node `3` to any outbound
# edges, filtering to those edges that have
# numeric values greater than `5.0` for
# the `rel` edge attribute
graph %>%
  select_nodes_by_id(nodes = 3) %>%
  trav_out_edge(
    conditions = values > 5.0) %>%
  get_selection()

# Traverse from node `1` to any outbound
# edges, filtering to those edges that
# have values equal to `A` for the `rel`
# edge attribute
graph %>%
  select_nodes_by_id(nodes = 1) %>%
  trav_out_edge(
    conditions = rel == "A") %>%
  get_selection()

# Traverse from node `2` to any outbound
# edges, filtering to those edges that
# have values in the set `B` and `C` for
# the `rel` edge attribute
graph %>%
  select_nodes_by_id(nodes = 2) %>%
  trav_out_edge(
    conditions = rel %in% c("B", "C")) %>%
  get_selection()

# Traverse from node `2` to any
# outbound edges, and use multiple
# conditions for the traversal
graph %>%
  select_nodes_by_id(nodes = 2) %>%
  trav_out_edge(
    conditions =
      rel %in% c("B", "C") &
      values >= 5.0) %>%
  get_selection()

# Traverse from node `2` to any
# outbound edges, and use multiple
# conditions
graph %>%
  select_nodes_by_id(nodes = 2) %>%
  trav_out_edge(
    conditions =
      rel %in% c("B", "C") |
      values > 6.0) %>%
  get_selection()

# Traverse from node `2` to any outbound
# edges, and use a regular expression as
# a filtering condition
graph %>%
  select_nodes_by_id(nodes = 2) %>%
  trav_out_edge(
    conditions = grepl("B|C", rel)) %>%
  get_selection()

# Perform a traversal from all nodes to
# their outgoing edges and, while doing
# so, copy the `label` node attribute
# to any of the nodes' incoming edges
graph <-
  graph %>%
  select_nodes() %>%
  trav_out_edge(
    copy_attrs_from = label)

# Show the graph's internal edge
# data frame after this change
graph %>%
  get_edge_df()



