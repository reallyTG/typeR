library(DiagrammeR)


### Name: select_edges_by_edge_id
### Title: Select edges in a graph using edge ID values
### Aliases: select_edges_by_edge_id

### ** Examples

# Create a graph with 5 nodes
graph <-
  create_graph() %>%
  add_path(n = 5)

# Create a graph selection by selecting
# edges with edge IDs `1` and `2`
graph <-
  graph %>%
  select_edges_by_edge_id(
    edges = 1:2)

# Get the selection of edges
graph %>%
  get_selection()

# Perform another selection of edges,
# with edge IDs `1`, `2`, and `4`
graph <-
  graph %>%
  clear_selection() %>%
  select_edges_by_edge_id(
    edges = c(1, 2, 4))

# Get the selection of edges
graph %>%
  get_selection()

# Get the fraction of edges selected
# over all the edges in the graph
graph %>%
  {
    l <- get_selection(.) %>%
      length(.)
    e <- count_edges(.)
    l/e
  }



