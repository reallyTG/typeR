library(DiagrammeR)


### Name: drop_node_attrs
### Title: Drop a node attribute column
### Aliases: drop_node_attrs

### ** Examples

graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 5,
    m = 10,
    set_seed = 23) %>%
 set_node_attrs(
    node_attr = value,
    values = rnorm(
      n = count_nodes(.),
      mean = 5,
      sd = 1) %>% round(1))

# Get the graph's internal
# ndf to show which node
# attributes are available
graph %>%
  get_node_df()

# Drop the `value` node
# attribute
graph <-
  graph %>%
  drop_node_attrs(
    node_attr = value)

# Get the graph's internal
# ndf to show that the node
# attribute `value` had been
# removed
graph %>%
  get_node_df()



