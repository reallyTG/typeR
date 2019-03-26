library(DiagrammeR)


### Name: get_degree_histogram
### Title: Get histogram data for a graph's degree frequency
### Aliases: get_degree_histogram

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

# Get degree histogram data for
# the graph (reporting total degree)
graph %>%
  get_degree_histogram(
    mode = "total")



