library(DiagrammeR)


### Name: get_degree_distribution
### Title: Get total degree distribution data for a graph
### Aliases: get_degree_distribution

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph(
    directed = FALSE) %>%
  add_gnm_graph(
    n = 10,
    m = 15,
    set_seed = 23)

# Get the total degree
# distribution for the graph
graph %>%
  get_degree_distribution(
    mode = "total")



