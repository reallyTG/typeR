library(DiagrammeR)


### Name: recode_edge_attrs
### Title: Recode a set of edge attribute values
### Aliases: recode_edge_attrs

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 4,
    m = 6,
    set_seed = 23) %>%
  set_edge_attrs(
    edge_attr = rel,
    values = c("a", "b", "a",
               "c", "b", "d"))

# Get the graph's internal edf
# to show which edge attributes
# are available
graph %>%
  get_edge_df()

# Recode the `rel` node
# attribute, creating a new edge
# attribute called `penwidth`;
# here, `a` is recoded to `1.0`,
# `b` maps to `1.5`, and all
# other values become `0.5`
graph <-
  graph %>%
  recode_edge_attrs(
    edge_attr_from = rel,
    "a -> 1.0",
    "b -> 1.5",
    otherwise = 0.5,
    edge_attr_to = penwidth)

# Get the graph's internal edf
# to show that the node
# attribute values had been
# recoded and copied into a
# new node attribute
graph %>%
  get_edge_df()



