library(DiagrammeR)


### Name: add_nodes_from_df_cols
### Title: Add nodes from distinct values in data frame columns
### Aliases: add_nodes_from_df_cols

### ** Examples

# Create an empty graph
graph <- create_graph()

# Create a data frame from
# which several columns have
# values designated as graph nodes
df <-
  data.frame(
    col_1 = c("f", "p", "q"),
    col_2 = c("q", "x", "f"),
    col_3 = c(1, 5, 3),
    col_4 = c("a", "v", "h"),
    stringsAsFactors = FALSE)

# Add nodes from columns `col_1`
# and `col_2` from the data frame
# to the graph object
graph <-
  graph %>%
  add_nodes_from_df_cols(
    df = df,
    columns = c("col_1", "col_2"))

# Show the graph's node data
# frame; duplicate labels are
# prevented with `keep_duplicates =
# FALSE`)
graph %>%
  get_node_df()

# Add new nodes from columns 3 and 4;
# We can specify the columns by their
# numbers as well
graph <-
  graph %>%
  add_nodes_from_df_cols(
    df = df,
    columns = 3:4)

# Show the graph's node data
# frame; note that nodes didn't
# get made with columns that
# are not character class columns
graph %>%
  get_node_df()



