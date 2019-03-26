library(DiagrammeR)


### Name: is_graph_connected
### Title: Is the graph a connected graph?
### Aliases: is_graph_connected

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function; this
# graph is not connected
create_graph() %>%
  add_gnm_graph(
    n = 15,
    m = 10,
    set_seed = 23) %>%
  is_graph_connected()

# Create another random graph;
# this graph is connected
create_graph() %>%
  add_gnm_graph(
    n = 10,
    m = 15,
    set_seed = 23) %>%
  is_graph_connected()



