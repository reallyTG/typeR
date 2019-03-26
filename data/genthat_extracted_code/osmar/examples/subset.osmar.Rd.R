library(osmar)


### Name: subset.osmar
### Title: Subset an osmar object
### Aliases: subset.osmar

### ** Examples

data("muc", package = "osmar")
  id <- find(muc, node(tags(v == "Marienplatz")))

  subset(muc, node_ids = id)

  subset(muc, ids = find_up(muc, node(id)))



