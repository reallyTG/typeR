library(DiagrammeR)


### Name: mutate_node_attrs_ws
### Title: Mutate node attribute values for a selection of nodes
### Aliases: mutate_node_attrs_ws

### ** Examples

# Create a graph with 3 nodes
# and then select node `1`
graph <-
  create_graph() %>%
  add_path(n = 3) %>%
  set_node_attrs(
    node_attr = width,
    values = c(1.4, 0.3, 1.1)) %>%
  select_nodes(nodes = 1)

# Get the graph's internal ndf
# to show which node attributes
# are available
graph %>%
  get_node_df()

# Mutate the `width` node
# attribute for the nodes
# only in the active selection
# of nodes (node `1`); here,
# we divide each value in the
# selection by 2
graph <-
  graph %>%
  mutate_node_attrs_ws(
    width = width / 2)

# Get the graph's internal
# ndf to show that the node
# attribute `width` was
# mutated only for node `1`
graph %>%
  get_node_df()

# Create a new node attribute,
# called `length`, that is the
# log of values in `width` plus
# 2 (and, also, round all values
# to 2 decimal places)
graph <-
  graph %>%
  clear_selection() %>%
  select_nodes(nodes = 2:3) %>%
  mutate_node_attrs_ws(
    length = (log(width) + 2) %>%
               round(2))

# Get the graph's internal ndf
# to show that the node attribute
# values had been mutated only
# for nodes `2` and `3` (since
# node `1` is excluded, an NA
# value is applied)
graph %>%
  get_node_df()

# Create a new node attribute
# called `area`, which is the
# product of the `width` and
# `length` attributes
graph <-
  graph %>%
  mutate_node_attrs_ws(
    area = width * length)

# Get the graph's internal ndf
# to show that the node attribute
# values had been multiplied
# together (with new attr `area`)
# for nodes `2` and `3`
graph %>%
  get_node_df()

# We can invert the selection
# and mutate node `1` several
# times to get an `area` value
# for that node
graph <-
  graph %>%
  invert_selection() %>%
  mutate_node_attrs_ws(
    length = (log(width) + 5) %>%
               round(2),
    area = width * length)

# Get the graph's internal ndf
# to show that the 2 mutations
# occurred for node `1`, yielding
# non-NA values for its node
# attributes without changing
# those of the other nodes
graph %>%
  get_node_df()



