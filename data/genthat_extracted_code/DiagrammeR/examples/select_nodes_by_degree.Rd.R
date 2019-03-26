library(DiagrammeR)


### Name: select_nodes_by_degree
### Title: Select nodes in the graph based on their degree values
### Aliases: select_nodes_by_degree

### ** Examples

# Create a random graph using
# the `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 35, m = 125,
    set_seed = 23)

# Report which nodes have a
# total degree (in-degree +
# out-degree) of exactly 9
graph %>%
  select_nodes_by_degree(
    expressions = "deg == 9") %>%
  get_selection()

# Report which nodes have a
# total degree greater than or
# equal to 9
graph %>%
  select_nodes_by_degree(
    expressions = "deg >= 9") %>%
  get_selection()

# Combine two calls of
# `select_nodes_by_degree()` to
# get those nodes with total
# degree less than 3 and total
# degree greater than 10 (by
# default, those `select...()`
# functions will `union` the
# sets of nodes selected)
graph %>%
  select_nodes_by_degree(
    expressions = "deg < 3") %>%
  select_nodes_by_degree(
    expressions = "deg > 10") %>%
  get_selection()

# Combine two calls of
# `select_nodes_by_degree()` to
# get those nodes with total
# degree greater than or equal
# to 3 and less than or equal
# to 10 (the key here is to
# `intersect` the sets of nodes
# selected in the second call)
graph %>%
  select_nodes_by_degree(
    expressions = "deg >= 3") %>%
  select_nodes_by_degree(
    expressions = "deg <= 10",
    set_op = "intersect") %>%
  get_selection()

# Select all nodes with an
# in-degree greater than 5, then,
# apply a node attribute to those
# selected nodes (coloring the
# selected nodes red)
graph_2 <-
  graph %>%
  select_nodes_by_degree(
    expressions = "indeg > 5") %>%
  set_node_attrs_ws(
    node_attr = color,
    value = "red")

# Get the selection of nodes
graph_2 %>%
  get_selection()



