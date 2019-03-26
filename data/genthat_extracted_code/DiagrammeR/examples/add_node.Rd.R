library(DiagrammeR)


### Name: add_node
### Title: Add a node to an existing graph object
### Aliases: add_node

### ** Examples

# Create an empty graph and add 2 nodes by using
# the `add_node()` function twice
graph <-
  create_graph() %>%
  add_node() %>%
  add_node()

# Get a count of all nodes
# in the graph
graph %>%
  count_nodes()

# The nodes added were given
# ID values `1` and `2`; obtain
# the graph's node IDs
graph %>%
  get_node_ids()

# Add a node with a `type`
# value defined
graph <-
  graph %>%
  add_node(type = "person")

# View the graph's internal
# node data frame (ndf)
graph %>%
  get_node_df()



