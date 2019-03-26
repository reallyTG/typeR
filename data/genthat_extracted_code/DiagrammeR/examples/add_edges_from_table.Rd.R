library(DiagrammeR)


### Name: add_edges_from_table
### Title: Add edges and attributes to graph from a table
### Aliases: add_edges_from_table

### ** Examples

# Create an empty graph and then
# add nodes to it from the
# `currencies` dataset available
# in the package
graph <-
  create_graph() %>%
  add_nodes_from_table(
    table = currencies)

# Now we want to add edges to the
# graph using an included dataset,
# `usd_exchange_rates`, which has
# exchange rates between USD and
# many other currencies; the key
# here is that the data in the
# `from` and `to` columns in the
# external table maps to graph
# node data available in the
# `iso_4217_code` column of the
# graph's internal node data frame
graph_1 <-
  graph %>%
    add_edges_from_table(
      table = usd_exchange_rates,
      from_col = from_currency,
      to_col = to_currency,
      from_to_map = iso_4217_code)

# View part of the graph's
# internal edge data frame
graph_1 %>%
  get_edge_df() %>%
  head()

# If you would like to assign
# any of the table's columns as the
# `rel` attribute, this can done
# with the `rel_col` argument; to
# set a static `rel` attribute for
# all edges created, use `set_rel`
graph_2 <-
  graph %>%
    add_edges_from_table(
      table = usd_exchange_rates,
      from_col = from_currency,
      to_col = to_currency,
      from_to_map = iso_4217_code,
      set_rel = "from_usd")

# View part of the graph's internal
# edge data frame (edf)
graph_2 %>%
  get_edge_df() %>%
  head()



