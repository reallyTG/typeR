library(DiagrammeR)


### Name: get_w_connected_cmpts
### Title: Get all nodes associated with connected components
### Aliases: get_w_connected_cmpts

### ** Examples

# Create a graph with 2 cycles
graph <-
  create_graph() %>%
  add_cycle(n = 4) %>%
  add_cycle(n = 3)

# Check if the graph is connected
graph %>%
  is_graph_connected()

# Get the graph's weakly-connected
# components
graph %>%
  get_w_connected_cmpts()



