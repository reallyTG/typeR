library(DiagrammeR)


### Name: get_node_info
### Title: Get detailed information on nodes
### Aliases: get_node_info

### ** Examples

# Create a simple graph
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 5, m = 10,
    set_seed = 23)

# Get information on the
# graph's nodes
graph %>%
  get_node_info()



