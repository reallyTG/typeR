library(osmar)


### Name: as_osmar_bbox.Spatial
### Title: Convert sp object to an osmar object
### Aliases: as_osmar_bbox.Spatial

### ** Examples

data("muc", package = "osmar")
  muc_points <- as_sp(muc, "points")
  bbox(muc_points)           # sp::bbox object
  as_osmar_bbox(muc_points)  # osmar::bbox object



