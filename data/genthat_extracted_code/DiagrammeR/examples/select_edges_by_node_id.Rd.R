library(DiagrammeR)


### Name: select_edges_by_node_id
### Title: Select edges in a graph using node ID values
### Aliases: select_edges_by_node_id

### ** Examples

# Create a graph with 5 nodes
graph <-
  create_graph() %>%
  add_path(n = 5)

# Create a graph selection by selecting edges
# associated with nodes `1` and `2`
graph <-
  graph %>%
  select_edges_by_node_id(
    nodes = 1:2)

# Get the selection of edges
graph %>%
  get_selection()

# Perform another selection of edges, with nodes
# `1`, `2`, and `4`
graph <-
  graph %>%
  clear_selection() %>%
  select_edges_by_node_id(
    nodes = c(1, 2, 4))

# Get the selection of edges
graph %>%
  get_selection()

# Get a fraction of the edges selected over all
# the edges in the graph
graph %>%
  {
    l <- get_selection(.) %>%
      length(.)
    e <- count_edges(.)
    l/e
  }



