library(osmar)


### Name: find_down
### Title: Find all elements related to an ID
### Aliases: find_down find_up

### ** Examples

data("muc", package = "osmar")
  o1 <- find(muc, way(tags(k == "highway" & v == "pedestrian")))

  find_down(muc, way(o1))
  find_up(muc, way(o1))



