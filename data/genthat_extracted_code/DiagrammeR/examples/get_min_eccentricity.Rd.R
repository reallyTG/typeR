library(DiagrammeR)


### Name: get_min_eccentricity
### Title: Get the minimum graph eccentricity
### Aliases: get_min_eccentricity

### ** Examples

# Create a cycle graph
graph <-
  create_graph() %>%
  add_cycle(n = 5)

# Determine the graph's minimum
# eccentricity
graph %>%
  get_min_eccentricity()

# Create a full graph and then
# get the minimum eccentricity
# value for that
create_graph() %>%
  add_full_graph(n = 10) %>%
  get_min_eccentricity()



