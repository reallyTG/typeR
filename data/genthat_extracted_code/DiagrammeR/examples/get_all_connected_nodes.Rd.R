library(DiagrammeR)


### Name: get_all_connected_nodes
### Title: Get all nodes connected to a specified node
### Aliases: get_all_connected_nodes

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function; it
# has an unconnected node (`6`)
graph_1 <-
  create_graph() %>%
  add_gnm_graph(
    n = 20,
    m = 32,
    set_seed = 23)

# There won't be any connected
# nodes to `6` so when specifying
# this node with `get_all_connected_nodes()`
# we get NA back
graph_1 %>%
  get_all_connected_nodes(
    node = 6)

# Any other node in `graph_1` will
# provide a vector of all the nodes
# other than `6`
graph_1 %>%
  get_all_connected_nodes(
    node = 1)

# The following graph has two
# clusters of nodes (i.e., the
# graph has two connected components)
graph_2 <-
  create_graph() %>%
  add_path(n = 6) %>%
  add_path(n = 4)

# In `graph_2`, node `1` is in
# the larger of the two
# connected components
graph_2 %>%
  get_all_connected_nodes(
    node = 1)

# Also in `graph_2`, node `8`
# is in the smaller of the two
# connected components
graph_2 %>%
  get_all_connected_nodes(
    node = 8)



