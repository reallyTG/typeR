library(DiagrammeR)


### Name: mutate_edge_attrs
### Title: Mutate a set of edge attribute values
### Aliases: mutate_edge_attrs

### ** Examples

# Create a graph with 3 edges
graph <-
  create_graph() %>%
  add_path(n = 4) %>%
  set_edge_attrs(
    edge_attr = width,
    values = c(3.4, 2.3, 7.2))

# Get the graph's internal edf
# to show which edge attributes
# are available
graph %>%
  get_edge_df()

# Mutate the `width` edge
# attribute, dividing each
# value by 2
graph <-
  graph %>%
  mutate_edge_attrs(
    width = width / 2)

# Get the graph's internal
# edf to show that the edge
# attribute `width` had its
# values changed
graph %>%
  get_edge_df()

# Create a new edge attribute,
# called `length`, that is the
# log of values in `width` plus
# 2 (and, also, round all values
# to 2 decimal places)
graph <-
  graph %>%
  mutate_edge_attrs(
    length = (log(width) + 2) %>%
               round(2))

# Get the graph's internal edf
# to show that the edge attribute
# values had been mutated
graph %>%
  get_edge_df()

# Create a new edge attribute
# called `area`, which is the
# product of the `width` and
# `length` attributes
graph <-
  graph %>%
  mutate_edge_attrs(
    area = width * length)

# Get the graph's internal edf
# to show that the edge attribute
# values had been multiplied
# together (with new attr `area`)
graph %>%
  get_edge_df()



