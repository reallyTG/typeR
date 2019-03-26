library(DiagrammeR)


### Name: get_cmty_louvain
### Title: Get community membership by Louvain optimization
### Aliases: get_cmty_louvain

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

# Get the group membership values
# for all nodes in the graph
# through the multi-level
# optimization of modularity
# algorithm
graph %>%
  get_cmty_louvain()

# Add the group membership
# values to the graph as a
# node attribute
graph <-
  graph %>%
  join_node_attrs(
    df = get_cmty_louvain(.))

# Display the graph's
# node data frame
graph %>%
  get_node_df()



