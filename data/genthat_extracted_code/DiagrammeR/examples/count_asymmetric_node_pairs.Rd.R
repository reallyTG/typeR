library(DiagrammeR)


### Name: count_asymmetric_node_pairs
### Title: Get the number of asymmetrically-connected node pairs
### Aliases: count_asymmetric_node_pairs

### ** Examples

# Create a cycle graph
graph <-
  create_graph() %>%
  add_cycle(n = 5)

# Get a count of asymmetrically-
# connected node pairs
graph %>%
  count_asymmetric_node_pairs()

# Create a full graph and then
# count the asymmetrically-
# connected node pairs
create_graph() %>%
  add_full_graph(n = 10) %>%
  count_asymmetric_node_pairs()



