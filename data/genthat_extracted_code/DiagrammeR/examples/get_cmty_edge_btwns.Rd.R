library(DiagrammeR)


### Name: get_cmty_edge_btwns
### Title: Get community membership by edge betweenness
### Aliases: get_cmty_edge_btwns

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph(
    directed = FALSE) %>%
  add_gnm_graph(
    n = 10,
    m = 15,
    set_seed = 23)

# Get the group membership
# values for all nodes in the
# graph through calculation of
# the leading non-negative
# eigenvector of the modularity
# matrix of the graph
graph %>%
  get_cmty_edge_btwns()

# Add the group membership
# values to the graph
# as a node attribute
graph <-
  graph %>%
  join_node_attrs(
     df = get_cmty_edge_btwns(.))

# Display the graph's
# node data frame
graph %>%
  get_node_df()



