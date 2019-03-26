library(DiagrammeR)


### Name: get_pagerank
### Title: Get the PageRank values for all nodes
### Aliases: get_pagerank

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 10,
    m = 15,
    set_seed = 23)

# Get the PageRank scores
# for all nodes in the graph
graph %>%
  get_pagerank()

# Colorize nodes according to their
# PageRank scores
graph <-
  graph %>%
  join_node_attrs(
    df = get_pagerank(graph = .)) %>%
  colorize_node_attrs(
    node_attr_from = pagerank,
    node_attr_to = fillcolor,
    palette = "RdYlGn")



