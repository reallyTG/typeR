library(DiagrammeR)


### Name: create_node_df
### Title: Create a node data frame
### Aliases: create_node_df

### ** Examples

# Create a node data frame (ndf) where the labels
# are equivalent to the node ID values (this is not
# recommended); the `label` and `type` node
# attributes will always be a `character` class
# whereas `id` will always be an `integer`
node_df <-
  create_node_df(
    n = 4,
    type = c("a", "a", "b", "b"),
    label = TRUE)

# Display the node data frame
node_df

# Create an ndf with distinct labels and
# additional node attributes (where their classes
# will be inferred from the input vectors)
node_df <-
  create_node_df(
    n = 4,
    type = "a",
    label = c(2384, 3942, 8362, 2194),
    style = "filled",
    color = "aqua",
    shape = c("circle", "circle",
              "rectangle", "rectangle"),
    value = c(3.5, 2.6, 9.4, 2.7))

# Display the node data frame
node_df



