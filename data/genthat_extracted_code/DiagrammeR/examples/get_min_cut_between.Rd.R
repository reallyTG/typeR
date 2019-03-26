library(DiagrammeR)


### Name: get_min_cut_between
### Title: Get the minimum cut between source and sink nodes
### Aliases: get_min_cut_between

### ** Examples

# Set a seed
set.seed(23)

# Create a cycle graph
graph <-
  create_graph() %>%
  add_cycle(n = 5)

# Determine the minimum cut
# between nodes `1` and `4`
graph %>%
  get_min_cut_between(
    from = 1,
    to = 2)

# Create a cycle graph with
# randomized values given to all
# edges as the `capacity` attribute
graph_capacity <-
  create_graph() %>%
  add_cycle(n = 5) %>%
  select_edges() %>%
  set_edge_attrs_ws(
    edge_attr = capacity,
    value =
      rnorm(
        n = count_edges(.),
        mean = 5,
        sd = 1)) %>%
  clear_selection()

# Determine the minimum cut
# between nodes `1` and `4` for
# this graph, where `capacity`is
# set as an edge attribute
graph_capacity %>%
  get_min_cut_between(
    from = 1,
    to = 2)

# Create a full graph and then
# get the minimum cut requirement
# between nodes `2` and `8`
create_graph() %>%
  add_full_graph(n = 10) %>%
  get_min_cut_between(
    from = 2,
    to = 8)



