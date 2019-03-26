library(DiagrammeR)


### Name: get_mean_distance
### Title: Get the mean distance
### Aliases: get_mean_distance

### ** Examples

# Create a cycle graph
graph <-
  create_graph() %>%
  add_cycle(n = 5)

# Determine the mean distance
graph %>%
  get_mean_distance()

# Create a full graph and then
# get the mean distance value
create_graph() %>%
  add_full_graph(n = 10) %>%
  get_mean_distance()



