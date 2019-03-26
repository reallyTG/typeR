library(osmplotr)


### Name: add_osm_surface
### Title: add_osm_suface
### Aliases: add_osm_surface

### ** Examples

# Get some data
bbox <- get_bbox (c (-0.13, 51.5, -0.11, 51.52))
# dat_B <- extract_osm_objects (key = 'building', bbox = bbox)
# These data are also provided in
dat_B <- london$dat_BNR # actuall non-residential buildings
# Make a data surface across the map coordinates, and remove periphery
n <- 5
x <- seq (bbox [1,1], bbox [1,2], length.out = n)
y <- seq (bbox [2,1], bbox [2,2], length.out = n)
dat <- data.frame (
    x = as.vector (array (x, dim = c(n, n))),
    y = as.vector (t (array (y, dim = c(n, n)))),
    z = x * y
    )
## Not run: 
##D map <- osm_basemap (bbox = bbox, bg = 'gray20')
##D map <- add_osm_surface (map, dat_B, dat = dat, cols = heat.colors (30))
##D print_osm_map (map)
## End(Not run)

# If data do not cover the entire map region, then the peripheral remainder can
# be plotted by specifying the 'bg' colour. First remove periphery from
# 'dat':
d <- sqrt ((dat$x - mean (dat$x)) ^ 2 + (dat$y - mean (dat$y)) ^ 2)
dat <- dat [which (d < 0.01),]
## Not run: 
##D map <- osm_basemap (bbox = bbox, bg = 'gray20')
##D map <- add_osm_surface (map, dat_B, dat = dat, cols = heat.colors (30), bg = 'gray40')
##D print_osm_map (map)
## End(Not run)

# Polygons and (lines/points) can be overlaid as data surfaces with different
# colour schemes.
# dat_HP <- extract_osm_objects (key = 'highway', value = 'primary', bbox = bbox)
# These data are also provided in
dat_HP <- london$dat_HP
cols <- adjust_colours (heat.colors (30), adj = -0.2) # darken by 20%
## Not run: 
##D map <- add_osm_surface (map, dat_HP, dat, cols = cols, bg = 'gray60', size = c(1.5,0.5))
##D print_osm_map (map)
## End(Not run)

# Adding multiple surfaces of either polygons or (lines/points) produces a
# 'ggplot2' warning, and forces the colour gradient to revert to the last given
# value.
dat_T <- london$dat_T # trees
## Not run: 
##D map <- osm_basemap (bbox = bbox, bg = 'gray20')
##D map <- add_osm_surface (map, dat_B, dat = dat, cols = heat.colors (30), bg = 'gray40')
##D map <- add_osm_surface (map, dat_HP, dat, cols = heat.colors (30), bg = 'gray60', 
##D                         size = c(1.5,0.5))
##D map <- add_osm_surface (map, dat_T, dat, cols = topo.colors (30),
##D                         bg = 'gray70', size = c(5,2), shape = c(8, 1))
##D print_osm_map (map) # 'dat_HP' is in 'topo.colors' not 'heat.colors'
## End(Not run)

# Add axes and colourbar
## Not run: 
##D map <- add_axes (map)
##D map <- add_colourbar (map, cols = heat.colors (100), zlims = range (dat$z),
##D                       barwidth = c(0.02), barlength = c(0.6,0.99), vertical = TRUE)
##D print_osm_map (map)
## End(Not run)



