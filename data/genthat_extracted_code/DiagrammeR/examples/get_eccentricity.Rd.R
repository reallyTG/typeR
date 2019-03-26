library(DiagrammeR)


### Name: get_eccentricity
### Title: Get node eccentricities
### Aliases: get_eccentricity

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

# Get the eccentricity values for
# all nodes in the graph
graph %>%
  get_eccentricity()



