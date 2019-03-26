library(DiagrammeR)


### Name: delete_edge
### Title: Delete an edge from an existing graph object
### Aliases: delete_edge

### ** Examples

# Create a graph with 2 nodes
graph <-
  create_graph() %>%
  add_n_nodes(n = 2)

# Add an edge
graph <-
  graph %>%
  add_edge(
    from = 1,
    to = 2)

# Delete the edge
graph <-
  graph %>%
  delete_edge(
    from = 1,
    to = 2)

# Get the count of edges in the graph
graph %>%
  count_edges()

# Create an undirected graph with
# 2 nodes and an edge
graph_undirected <-
  create_graph(directed = FALSE) %>%
  add_n_nodes(n = 2) %>%
  add_edge(
    from = 1,
    to = 2)

# Delete the edge; the order of node ID
# values provided in `from` and `to`
# don't matter for the undirected case
graph_undirected %>%
  delete_edge(
    from = 2,
    to = 1) %>%
  count_edges()

# The undirected graph has a single
# edge with ID `1`; it can be
# deleted by specifying `id`
graph_undirected %>%
  delete_edge(id = 1) %>%
  count_edges()

# Create a directed graph with 2
# labeled nodes and an edge
graph_labeled_nodes <-
  create_graph() %>%
  add_n_nodes(
    n = 2,
    label = c("one", "two")) %>%
  add_edge(
    from = "one",
    to = "two")

# Delete the edge using the node
# labels in `from` and `to`; this
# is analogous to creating the
# edge using node labels
graph_labeled_nodes %>%
  delete_edge(
    from = "one",
    to = "two") %>%
  count_edges()



