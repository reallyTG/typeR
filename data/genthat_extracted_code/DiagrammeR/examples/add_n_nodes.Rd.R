library(DiagrammeR)


### Name: add_n_nodes
### Title: Add one or several unconnected nodes to the graph
### Aliases: add_n_nodes

### ** Examples

# Create an empty graph and
# add 5 nodes; these nodes
# will be assigned ID values
# from `1` to `5`
graph <-
  create_graph() %>%
  add_n_nodes(n = 5)

# Get the graph's node IDs
graph %>%
  get_node_ids()



