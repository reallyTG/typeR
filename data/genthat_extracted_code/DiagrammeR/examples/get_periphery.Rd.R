library(DiagrammeR)


### Name: get_periphery
### Title: Get nodes that form the graph periphery
### Aliases: get_periphery

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function and
# get the nodes in the graph periphery
create_graph() %>%
  add_gnm_graph(
    n = 28,
    m = 35,
    set_seed = 23) %>%
  get_periphery()



