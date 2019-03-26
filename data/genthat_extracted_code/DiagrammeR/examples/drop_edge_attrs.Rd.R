library(DiagrammeR)


### Name: drop_edge_attrs
### Title: Drop an edge attribute column
### Aliases: drop_edge_attrs

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 5,
    m = 6,
    set_seed = 23) %>%
  set_edge_attrs(
    edge_attr = value,
    values = 3) %>%
  mutate_edge_attrs(
    penwidth = value * 2)

# Get the graph's internal
# edf to show which edge
# attributes are available
graph %>%
  get_edge_df()

# Drop the `value` edge
# attribute
graph <-
  graph %>%
  drop_edge_attrs(
    edge_attr = value)

# Get the graph's internal
# edf to show that the edge
# attribute `value` had been
# removed
graph %>%
  get_edge_df()



