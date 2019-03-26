library(DiagrammeR)


### Name: get_cache
### Title: Get a cached vector from a graph object
### Aliases: get_cache

### ** Examples

# Set a seed
set.seed(23)

# Create a graph with 5 nodes and 5 edges
graph <-
  create_graph() %>%
  add_n_nodes(n = 5) %>%
  set_node_attrs(
    node_attr = value,
    values = rnorm(
      n = count_nodes(.),
      mean = 8,
      sd = 2)) %>%
  add_edges_w_string(
    edges = "1->2 1->3 2->4 2->5 3->2")

# Cache all values from the node attribute `value`
# as a numeric vector
graph <-
  graph %>%
  set_cache(
    name = "value",
    to_cache = get_node_attrs(
      graph = .,
      node_attr = value))

# Return the cached vector
graph %>%
  get_cache()



