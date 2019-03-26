library(DiagrammeR)


### Name: set_cache
### Title: Cache a vector in the graph
### Aliases: set_cache

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 10,
    m = 22,
    set_seed = 23)

# Get the closeness values for
# all nodes from `1` to `10` and
# store in the graph's cache
graph <-
  graph %>%
  set_cache(
    name = "closeness_vector",
    to_cache = get_closeness(.),
    col = "closeness")

# Get the graph's cache
graph %>%
  get_cache(
    name = "closeness_vector")

# Get the difference of betweenness
# and closeness values for nodes in
# the graph and store the vector in
# the graph's cache
graph <-
  graph %>%
  set_cache(
    name = "difference",
    to_cache =
      get_betweenness(.)$betweenness -
        get_closeness(.)$closeness)

# Get the graph's cache
graph %>%
  get_cache(
    name = "difference")



