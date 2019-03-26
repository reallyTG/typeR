library(osmar)


### Name: find_nearest_node
### Title: Find nearest node with given conditions
### Aliases: find_nearest_node

### ** Examples

data("muc", package = "osmar")
  id <- find(muc, node(tags(v == "Marienplatz")))[1]

  find_nearest_node(muc, id, way(tags(k == "highway" & v == "pedestrian")))



