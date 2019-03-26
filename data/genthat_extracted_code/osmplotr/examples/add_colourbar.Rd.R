library(osmplotr)


### Name: add_colourbar
### Title: add_colorbar
### Aliases: add_colourbar

### ** Examples

bbox <- get_bbox (c (-0.13, 51.5, -0.11, 51.52))
map <- osm_basemap (bbox = bbox, bg = "gray20")
# Align volcano data to lat-lon range of bbox
dv <- dim (volcano)
x <- seq (bbox [1,1], bbox [1,2], length.out = dv [1])
y <- seq (bbox [2,1], bbox [2,2], length.out = dv [2])
dat <- data.frame (
                  x = rep (x, dv [2]),
                  y = rep (y, each = dv [1]),
                  z = as.numeric (volcano)
                  )
map <- add_osm_surface (map, obj = london$dat_BNR, dat = dat,
                        cols = heat.colors (30))
map <- add_axes (map)
# Note colours of colourbar can be artibrarily set, and need not equal those
# passed to 'add_osm_surface'
map <- add_colourbar (map, zlims = range (volcano), cols = heat.colors(100),
                      text_col = "black")
print_osm_map (map)

# Horizontal colourbar shifted away from margins:
map <- osm_basemap (bbox = bbox, bg = "gray20")
map <- add_osm_surface (map, obj = london$dat_BNR, dat = dat,
                        cols = heat.colors (30))
map <- add_colourbar (map, zlims = range (volcano), cols = heat.colors(100),
                      barwidth = c(0.1,0.15), barlength = c(0.5, 0.9),
                      vertical = FALSE)
print_osm_map (map)



