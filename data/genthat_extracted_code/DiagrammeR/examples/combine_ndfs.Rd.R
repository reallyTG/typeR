library(DiagrammeR)


### Name: combine_ndfs
### Title: Combine multiple node data frames
### Aliases: combine_ndfs

### ** Examples

# Create two node data frames
node_df_1 <-
  create_node_df(
    n = 2,
    type = c("a", "b"),
    label = c("D", "Z"),
    value = c(8.4, 3.4))

node_df_2 <-
  create_node_df(
    n = 2,
    type = c("b", "c"),
    label = c("U", "A"),
    value = c(0.4, 3.4))

# Combine the ndfs using the
# `combine_ndfs()` function
node_df_combined <-
  combine_ndfs(
    node_df_1,
    node_df_2)

# Inspect the combined ndf
node_df_combined



