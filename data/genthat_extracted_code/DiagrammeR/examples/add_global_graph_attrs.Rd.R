library(DiagrammeR)


### Name: add_global_graph_attrs
### Title: Add one or more global graph attributes
### Aliases: add_global_graph_attrs

### ** Examples

# Create a new graph with no
# global graph attributes and
# add a global graph attribute
graph <-
  create_graph(
    attr_theme = NULL) %>%
  add_global_graph_attrs(
    attr = "overlap",
    value = "true",
    attr_type = "graph")

# Verify that the attribute
# addition has been made
graph %>%
  get_global_graph_attr_info()

# Add another attribute with
# `add_global_graph_attrs()`
graph <-
  graph %>%
  add_global_graph_attrs(
    attr = "penwidth",
    value = 12,
    attr_type = "node")

# Verify that the attribute
# addition has been made
graph %>%
  get_global_graph_attr_info()

# When adding an attribute where
# `attr` and `attr_type` already
# exists, the value provided will
# serve as an update
graph %>%
  add_global_graph_attrs(
    attr = "penwidth",
    value = 15,
    attr_type = "node") %>%
  get_global_graph_attr_info()



