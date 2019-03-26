library(lawn)


### Name: lawn_tag
### Title: Spatial join of points and polygons
### Aliases: lawn_tag

### ** Examples

bbox <- c(0, 0, 10, 10)
pts <- lawn_random(n = 30, bbox = bbox)
polys <- lawn_triangle_grid(bbox, 50, 'miles')
polys$features$properties$fill <- "#f92"
polys$features$properties$stroke <- 0
polys$features$properties$`fill-opacity` <- 1
lawn_tag(pts, polys, 'fill', 'marker-color')
## Not run: 
##D lawn_tag(pts, polys, 'fill', 'marker-color') %>% view
## End(Not run)



