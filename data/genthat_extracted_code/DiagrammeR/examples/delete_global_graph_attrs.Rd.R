library(DiagrammeR)


### Name: delete_global_graph_attrs
### Title: Delete one of the global graph attributes stored within a graph
###   object
### Aliases: delete_global_graph_attrs

### ** Examples

# Create a new graph and add
# some extra global graph attrs
graph <-
  create_graph() %>%
  add_global_graph_attrs(
    attr = "overlap",
    value = "true",
    attr_type = "graph") %>%
  add_global_graph_attrs(
    attr = "penwidth",
    value = 3,
    attr_type = "node") %>%
  add_global_graph_attrs(
    attr = "penwidth",
    value = 3,
    attr_type = "edge")

# Inspect the graph's global
# attributes
graph %>%
  get_global_graph_attr_info()

# Delete the `penwidth` attribute
# for the graph's nodes using the
# `delete_global_graph_attrs()` fcn
graph <-
  graph %>%
  delete_global_graph_attrs(
    attr = "penwidth",
    attr_type = "node")

# View the remaining set of global
# attributes for the graph
graph %>%
  get_global_graph_attr_info()



