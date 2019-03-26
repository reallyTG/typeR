library(DiagrammeR)


### Name: count_w_connected_cmpts
### Title: Get the number of weakly-connected components
### Aliases: count_w_connected_cmpts

### ** Examples

# Create a cycle graph
graph <-
  create_graph() %>%
  add_cycle(n = 5) %>%
  add_cycle(n = 5)

# Get a count of weakly-connected
# components in the graph
graph %>%
  count_w_connected_cmpts()



