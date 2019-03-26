library(DiagrammeR)


### Name: trav_in_edge
### Title: Traverse from one or more selected nodes onto adjacent, inward
###   edges
### Aliases: trav_in_edge

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

# Create a data frame with node ID
# values representing the graph edges
# (with `from` and `to` columns), and,
# a set of numeric values
df <-
  data.frame(
    from = c(1, 1, 2, 2, 3),
    to = c(2, 3, 4, 5, 5),
    values = round(rnorm(5, 5), 2))

# Join the data frame to the graph's
# internal edge data frame (edf)
graph <-
  graph %>%
  join_edge_attrs(df = df)

# Show the graph's internal edge data frame
graph %>%
  get_edge_df()

# Perform a simple traversal from
# nodes to inbound edges with no
# conditions on the nodes
# traversed to
graph %>%
  select_nodes_by_id(nodes = 2) %>%
  trav_in_edge() %>%
  get_selection()

# Traverse from node `2` to any
# inbound edges, filtering to
# those edges that have NA values
# for the `rel` edge attribute
graph %>%
  select_nodes_by_id(nodes = 2) %>%
  trav_in_edge(
    conditions = is.na(rel)) %>%
  get_selection()

# Traverse from node `2` to any
# inbound edges, filtering to those
# edges that do not have NA values
# for the `rel` edge attribute
# (since there are no allowed
# traversals, the selection of node
# `2` is retained)
graph %>%
  select_nodes_by_id(nodes = 2) %>%
  trav_in_edge(
    conditions = !is.na(rel)) %>%
  get_selection()

# Traverse from node `5` to any
# inbound edges, filtering to those
# edges that have numeric values
# greater than `5.5` for the `rel`
# edge attribute
graph %>%
  select_nodes_by_id(nodes = 5) %>%
  trav_in_edge(
    conditions = values > 5.5) %>%
  get_selection()

# Traverse from node `5` to any
# inbound edges, filtering to those
# edges that have values equal to
# `D` for the `rel` edge attribute
graph %>%
  select_nodes_by_id(nodes = 5) %>%
  trav_in_edge(
    conditions = rel == "D") %>%
  get_selection()

# Traverse from node `5` to any
# inbound edges, filtering to those
# edges that have values in the set
# `C` and `D` for the `rel` edge
# attribute
graph %>%
  select_nodes_by_id(nodes = 5) %>%
  trav_in_edge(
    conditions = rel %in% c("C", "D")) %>%
  get_selection()

# Traverse from node `5` to any
# inbound edges, and use multiple
# conditions for the traversal
graph %>%
  select_nodes_by_id(nodes = 5) %>%
  trav_in_edge(
    conditions =
      rel %in% c("C", "D") &
      values > 5.5) %>%
  get_selection()

# Traverse from node `5` to any
# inbound edges, and use multiple
# conditions with a single-length
# vector
graph %>%
  select_nodes_by_id(nodes = 5) %>%
  trav_in_edge(
    conditions =
      rel %in% c("D", "E") |
      values > 5.5) %>%
  get_selection()

# Traverse from node `5` to any
# inbound edges, and use a regular
# expression as a filtering condition
graph %>%
  select_nodes_by_id(nodes = 5) %>%
  trav_in_edge(
    conditions = grepl("C|D", rel)) %>%
  get_selection()

# Show the graph's internal ndf
graph %>%
  get_node_df()

# Show the graph's internal edf
graph %>%
  get_edge_df()

# Perform a traversal from all
# nodes to their incoming edges and,
# while doing so, copy the `label`
# node attribute to any of the nodes'
# incoming edges
graph <-
  graph %>%
  select_nodes() %>%
  trav_in_edge(
    copy_attrs_from = label)

# Show the graph's internal edge
# data frame after this change
graph %>%
  get_edge_df()



