library(DiagrammeR)


### Name: select_last_edges_created
### Title: Select the last set of edges created in a graph
### Aliases: select_last_edges_created

### ** Examples

# Create a graph and add a cycle and then
# a tree in 2 separate function calls
graph <-
  create_graph() %>%
  add_cycle(
    n = 3,
    rel = "a") %>%
  add_balanced_tree(
    k = 2, h = 2,
    rel = "b")

# Select the last edges created (all edges
# from the tree) and then set their edge
# color to be `red`
graph <-
  graph %>%
  select_last_edges_created() %>%
  set_edge_attrs_ws(
    edge_attr = color,
    value = "red") %>%
  clear_selection()

# Display the graph's internal edge
# data frame to verify the change
graph %>%
  get_edge_df()



