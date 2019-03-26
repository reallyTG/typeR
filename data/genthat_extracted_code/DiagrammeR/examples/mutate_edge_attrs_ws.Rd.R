library(DiagrammeR)


### Name: mutate_edge_attrs_ws
### Title: Mutate edge attribute values for a selection of edges
### Aliases: mutate_edge_attrs_ws

### ** Examples

# Create a graph with 3 edges
# and then select edge `1`
graph <-
  create_graph() %>%
  add_path(n = 4) %>%
  set_edge_attrs(
    edge_attr = width,
    values = c(3.4, 2.3, 7.2)) %>%
  select_edges(edges = 1)

# Get the graph's internal edf
# to show which edge attributes
# are available
graph %>%
  get_edge_df()

# Mutate the `width` edge
# attribute for the edges
# only in the active selection
# of edges (edge `1`); here,
# we divide each value in the
# selection by 2
graph <-
  graph %>%
  mutate_edge_attrs_ws(
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
  clear_selection() %>%
  select_edges(edges = 2:3) %>%
  mutate_edge_attrs_ws(
    length = (log(width) + 2) %>%
               round(2))

# Get the graph's internal edf
# to show that the edge attribute
# values had been mutated only
# for edges `2` and `3` (since
# edge `1` is excluded, an NA
# value is applied)
graph %>%
  get_edge_df()

# Create a new edge attribute
# called `area`, which is the
# product of the `width` and
# `length` attributes
graph <-
  graph %>%
  mutate_edge_attrs_ws(
    area = width * length)

# Get the graph's internal edf
# to show that the edge attribute
# values had been multiplied
# together (with new attr `area`)
# for nodes `2` and `3`
graph %>%
  get_edge_df()

# We can invert the selection
# and mutate edge `1` several
# times to get an `area` value
# for that edge
graph <-
  graph %>%
  invert_selection() %>%
  mutate_edge_attrs_ws(
    length = (log(width) + 5) %>%
               round(2),
    area = width * length)

# Get the graph's internal edf
# to show that the 2 mutations
# occurred for edge `1`, yielding
# non-NA values for its edge
# attributes without changing
# those of the other edges
graph %>%
  get_edge_df()



