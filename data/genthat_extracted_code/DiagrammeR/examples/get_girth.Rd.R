library(DiagrammeR)


### Name: get_girth
### Title: Get graph girth
### Aliases: get_girth

### ** Examples

# Create a cycle graph
graph <-
  create_graph() %>%
  add_cycle(n = 5)

# Determine the graph's girth
graph %>%
  get_girth()

# Create a full graph and then
# get the girth for that
create_graph() %>%
  add_full_graph(n = 10) %>%
  get_girth()



