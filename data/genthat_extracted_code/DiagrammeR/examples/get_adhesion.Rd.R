library(DiagrammeR)


### Name: get_adhesion
### Title: Get graph adhesion
### Aliases: get_adhesion

### ** Examples

# Create a cycle graph
graph <-
  create_graph() %>%
  add_cycle(n = 5)

# Determine the graph's adhesion
graph %>%
  get_adhesion()

# Create a full graph and then
# get the adhesion for that
create_graph() %>%
  add_full_graph(n = 8) %>%
  get_adhesion()



