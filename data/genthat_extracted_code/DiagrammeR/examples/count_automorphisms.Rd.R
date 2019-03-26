library(DiagrammeR)


### Name: count_automorphisms
### Title: Get the number of automorphisms
### Aliases: count_automorphisms

### ** Examples

# Create a cycle graph
graph <-
  create_graph() %>%
  add_cycle(n = 5)

# Get a count of automorphisms
graph %>%
  count_automorphisms()

# Create a full graph and then
# count the automorphisms
create_graph() %>%
  add_full_graph(n = 10) %>%
  count_automorphisms()



