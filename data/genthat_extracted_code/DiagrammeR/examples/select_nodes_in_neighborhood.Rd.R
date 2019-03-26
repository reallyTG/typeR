library(DiagrammeR)


### Name: select_nodes_in_neighborhood
### Title: Select nodes based on a walk distance from a specified node
### Aliases: select_nodes_in_neighborhood

### ** Examples

# Create a graph containing
# a balanced tree
graph <-
  create_graph() %>%
  add_balanced_tree(
    k = 2, h = 2)

# Create a graph selection by
# selecting nodes in the
# neighborhood of node `1`, where
# the neighborhood is limited by
# nodes that are 1 connection
# away from node `1`
graph <-
  graph %>%
  select_nodes_in_neighborhood(
    node = 1,
    distance = 1)

# Get the selection of nodes
graph %>%
  get_selection()

# Perform another selection
# of nodes, this time with a
# neighborhood spanning 2 nodes
# from node `1`
graph <-
  graph %>%
  clear_selection() %>%
  select_nodes_in_neighborhood(
    node = 1,
    distance = 2)

# Get the selection of nodes
graph %>%
  get_selection()



