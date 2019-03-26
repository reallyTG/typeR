library(DiagrammeR)


### Name: delete_node
### Title: Delete a node from an existing graph object
### Aliases: delete_node

### ** Examples

# Create a graph with 5 nodes and
# edges between each in a path
graph <-
  create_graph() %>%
  add_path(n = 5)

# Delete node with ID `3`
graph <- delete_node(graph, node = 3)

# Verify that the node with ID `3`
# is no longer in the graph
graph %>%
  get_node_ids()

# Also note that edges are removed
# since there were edges between the
# removed node to and from other nodes
graph %>%
  get_edges()



