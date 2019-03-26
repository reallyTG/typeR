library(osmar)


### Name: find
### Title: Find element for a given condition
### Aliases: find

### ** Examples

data("muc", package = "osmar")
  find(muc, node(tags(v == "Marienplatz")))
  find(muc, node(tags(v %agrep% "marienplatz")))
  find(muc, node(attrs(id == 19475890)))
  find(muc, way(tags(k == "highway" & v == "pedestrian")))



