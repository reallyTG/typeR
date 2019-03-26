library(DiagrammeR)


### Name: count_mutual_node_pairs
### Title: Get the number of mutually-connected node pairs
### Aliases: count_mutual_node_pairs

### ** Examples

# Create a cycle graph
graph <-
  create_graph() %>%
  add_cycle(n = 5)

# Get a count of mutually-connected
# node pairs
graph %>%
  count_mutual_node_pairs()

# Create a full graph and then
# count the mutually-connected
# node pairs
create_graph() %>%
  add_full_graph(n = 10) %>%
  count_mutual_node_pairs()



