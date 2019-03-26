library(DiagrammeR)


### Name: add_reverse_edges_ws
### Title: Add new edges in the opposite directions of a selection of edges
### Aliases: add_reverse_edges_ws

### ** Examples

# Create an empty graph, add 2 nodes to it,
# and create the edge `1->2`
graph <-
  create_graph() %>%
  add_n_nodes(
    n = 2,
    type = "type_a",
    label = c("a_1", "a_2")) %>%
  add_edge(
    from = 1,
    to = 2,
    rel = "a")

# Get the graph's edges
graph %>%
  get_edge_ids()

# Select the edge and create 2 additional edges
# with the opposite definition of `1->2`, which
# is `2->1`; also, apply, different `rel` values
# (`b` and `c`)
graph <-
  graph %>%
  select_edges() %>%
  add_reverse_edges_ws(rel = "b") %>%
  add_reverse_edges_ws(rel = "c") %>%
  clear_selection()

# Get the graph's edge data frame
graph %>%
  get_edge_df()



