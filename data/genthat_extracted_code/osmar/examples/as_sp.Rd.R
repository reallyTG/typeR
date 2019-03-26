library(osmar)


### Name: as_sp
### Title: Convert osmar object to sp object
### Aliases: as_sp

### ** Examples

data("muc", package = "osmar")
  muc_points <- as_sp(muc, "points")
  muc_lines <- as_sp(muc, "lines")
  muc_polygons <- as_sp(muc, "polygons")

  bbox(muc_points)



