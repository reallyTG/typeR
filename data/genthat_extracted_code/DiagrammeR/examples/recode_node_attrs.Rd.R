library(DiagrammeR)


### Name: recode_node_attrs
### Title: Recode a set of node attribute values
### Aliases: recode_node_attrs

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 5,
    m = 10,
    set_seed = 23) %>%
  set_node_attrs(
    node_attr = shape,
    values =
      c("circle", "hexagon",
        "rectangle", "rectangle",
        "circle"))

# Get the graph's internal ndf
# to show which node
# attributes are available
graph %>%
  get_node_df()

# Recode the `shape` node
# attribute, so that `circle`
# is recoded to `square` and that
# `rectangle` becomes `triangle`
graph <-
  graph %>%
  recode_node_attrs(
    node_attr_from = shape,
    "circle -> square",
    "rectangle -> triangle")

# Get the graph's internal
# ndf to show that the node
# attribute values had been recoded
graph %>%
  get_node_df()

# Create a new node attribute,
# called `color`, that is based
# on a recoding of `shape`; here,
# map the square shape to a `red`
# color and map all other shapes
# to a `green` color
graph <-
  graph %>%
  recode_node_attrs(
    node_attr_from = shape,
    "square -> red",
    otherwise = "green",
    node_attr_to = color)

# Get the graph's internal ndf
# to see the change
graph %>%
  get_node_df()



