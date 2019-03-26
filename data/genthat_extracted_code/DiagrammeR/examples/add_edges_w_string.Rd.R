library(DiagrammeR)


### Name: add_edges_w_string
### Title: Add one or more edges using a text string
### Aliases: add_edges_w_string

### ** Examples

# Create a graph with 4 nodes
graph <-
  create_graph() %>%
  add_node(label = "one") %>%
  add_node(label = "two") %>%
  add_node(label = "three") %>%
  add_node(label = "four")

# Add edges between nodes using
# a character string with node
# ID values
graph_node_id <-
  graph %>%
  add_edges_w_string(
    edges = "1->2 1->3 2->4 2->3")

# Show the graph's internal
# edge data frame
graph_node_id %>%
  get_edge_df()

# Add edges between nodes using
# a character string with node
# label values and setting
# `use_labels = TRUE`; note that
# all nodes must have unique
# `label` values to use this
graph_node_label <-
  graph %>%
  add_edges_w_string(
    edges =
      "one->two one->three
       two->four two->three",
    use_labels = TRUE)

# Show the graph's internal
# edge data frame (it's the
# same as before)
graph_node_label %>%
  get_edge_df()



