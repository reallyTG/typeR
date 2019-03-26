library(DiagrammeR)


### Name: count_unconnected_node_pairs
### Title: Get the number of unconnected node pairs
### Aliases: count_unconnected_node_pairs

### ** Examples

# Create a cycle graph
graph <-
  create_graph() %>%
  add_cycle(n = 5)

# Get a count of unconnected node
# pairs in the graph
graph %>%
  count_unconnected_node_pairs()

# Create a full graph and then
# count all unconnected node pairs
create_graph() %>%
  add_full_graph(n = 10) %>%
  count_unconnected_node_pairs()



