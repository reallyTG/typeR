library(DiagrammeR)


### Name: get_edge_info
### Title: Get detailed information on edges
### Aliases: get_edge_info

### ** Examples

# Create a simple graph
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 5, m = 10,
    set_seed = 23)

# Get information on the
# graph's edges
graph %>%
  get_edge_info()



