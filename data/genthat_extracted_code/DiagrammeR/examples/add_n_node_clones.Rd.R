library(DiagrammeR)


### Name: add_n_node_clones
### Title: Add one or several clones of an existing node to the graph
### Aliases: add_n_node_clones

### ** Examples

# Create a graph with a path of
# nodes; supply `label`, `type`,
# and `value` node attributes
graph <-
  create_graph() %>%
  add_path(
    n = 3,
    label = c("d", "g", "r"),
    type = c("a", "b", "c"))

# Display the graph's internal
# node data frame
graph %>%
  get_node_df()

# Create 3 clones of node `1`
# but assign new node label
# values (leaving `label` as
# NULL yields NA values)
graph <-
  graph %>%
  add_n_node_clones(
    n = 3,
    node = 1,
    label = c("x", "y", "z"))

# Display the graph's internal
# node data frame: nodes `4`,
# `5`, and `6` are clones of `1`
graph %>%
  get_node_df()



