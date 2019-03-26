library(DiagrammeR)


### Name: mutate_node_attrs
### Title: Mutate a set of node attribute values
### Aliases: mutate_node_attrs

### ** Examples

# Create a graph with 3 nodes
graph <-
  create_graph() %>%
  add_path(n = 3) %>%
  set_node_attrs(
    node_attr = width,
    values = c(1.4, 0.3, 1.1))

# Get the graph's internal ndf
# to show which node attributes
# are available
graph %>%
  get_node_df()

# Mutate the `width` node
# attribute, dividing each
# value by 2
graph <-
  graph %>%
  mutate_node_attrs(
    width = width / 2)

# Get the graph's internal
# ndf to show that the node
# attribute `width` had its
# values changed
graph %>%
  get_node_df()

# Create a new node attribute,
# called `length`, that is the
# log of values in `width` plus
# 2 (and, also, round all values
# to 2 decimal places)
graph <-
  graph %>%
  mutate_node_attrs(
    length = (log(width) + 2) %>%
               round(2))

# Get the graph's internal ndf
# to show that the node attribute
# values had been mutated
graph %>%
  get_node_df()

# Create a new node attribute
# called `area`, which is the
# product of the `width` and
# `length` attributes
graph <-
  graph %>%
  mutate_node_attrs(
    area = width * length)

# Get the graph's internal ndf
# to show that the node attribute
# values had been multiplied
# together (with new attr `area`)
graph %>%
  get_node_df()



