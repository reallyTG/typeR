library(DiagrammeR)


### Name: get_max_eccentricity
### Title: Get the maximum graph eccentricity
### Aliases: get_max_eccentricity

### ** Examples

# Create a cycle graph
graph <-
  create_graph() %>%
  add_cycle(n = 5)

# Determine the graph's maximum
# eccentricity
graph %>%
  get_max_eccentricity()

# Create a full graph and then
# get the maximum eccentricity
# value for that
create_graph() %>%
  add_full_graph(n = 10) %>%
  get_max_eccentricity()



