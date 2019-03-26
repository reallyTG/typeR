library(DiagrammeR)


### Name: get_cmty_fast_greedy
### Title: Get community membership by modularity optimization
### Aliases: get_cmty_fast_greedy

### ** Examples

# Create a graph with a
# balanced tree
graph <-
  create_graph() %>%
  add_balanced_tree(
    k = 2,
    h = 2)

# Get the group membership
# values for all nodes in
# the graph through the greedy
# optimization of modularity
# algorithm
graph %>%
  get_cmty_fast_greedy()

# Add the group membership
# values to the graph as a
# node attribute
graph <-
  graph %>%
  join_node_attrs(
    df = get_cmty_fast_greedy(.))

# Display the graph's
# node data frame
graph %>%
  get_node_df()



