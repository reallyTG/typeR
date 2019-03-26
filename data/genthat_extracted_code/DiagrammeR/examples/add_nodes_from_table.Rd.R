library(DiagrammeR)


### Name: add_nodes_from_table
### Title: Add nodes and attributes to graph from a table
### Aliases: add_nodes_from_table

### ** Examples

# To add nodes from the dataset called
# `currencies` (available as a dataset
# in the package), call the
# `add_nodes_from_table()` function
# after creating an empty graph; new
# node ID values will be created as
# monotonically-increasing values
graph_1 <-
  create_graph() %>%
  add_nodes_from_table(
    table = currencies)

# View part of the graph's internal
# node data frame (ndf)
graph_1 %>%
  get_node_df() %>%
  .[, 1:5] %>%
  head()

# If you would like to assign
# any of the table's columns as
# `type` or `label` attributes,
# this can be done with the `type_col`
# and `label_col` arguments; to set
# a static `type` attribute for all
# of the table records, use `set_type`
graph_2 <-
  create_graph() %>%
  add_nodes_from_table(
    table = currencies,
    label_col = iso_4217_code,
    set_type = currency)

# View part of the graph's internal ndf
graph_2 %>%
  get_node_df() %>%
  .[, 1:5] %>%
  head()

# Suppose we would like to not
# include certain columns from the
# external table in the resulting
# graph; we can use the `drop_cols`
# argument to choose which columns
# to not include as attributes
graph_3 <-
  create_graph() %>%
  add_nodes_from_table(
    table = currencies,
    label_col = iso_4217_code,
    set_type = currency,
    drop_cols = exponent & currency_name)

# Show the node attribute names
# for the graph; note that the
# `exponent` and `currency_name`
# columns are not attributes in the
# graph's internal node data frame
graph_3 %>%
  get_node_df() %>%
  colnames()



