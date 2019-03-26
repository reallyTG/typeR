library(osmplotr)


### Name: add_osm_groups
### Title: add_osm_groups
### Aliases: add_osm_groups

### ** Examples

bbox <- get_bbox (c (-0.13, 51.5, -0.11, 51.52))
# Download data using 'extract_osm_objects'
## Not run: 
##D dat_HP <- extract_osm_objects (key = 'highway', value = 'primary', bbox = bbox)
##D dat_T <- extract_osm_objects (key = 'tree', bbox = bbox)
##D dat_BNR <- extract_osm_objects (key = 'building', value = '!residential',
##D bbox = bbox)
## End(Not run)
# These data are also provided in
dat_HP <- london$dat_HP
dat_T <- london$dat_T
dat_BNR <- london$dat_BNR

# Define a function to easily generate a basemap
bmap <- function ()
{
    map <- osm_basemap (bbox = bbox, bg = "gray20")
    map <- add_osm_objects (map, dat_HP, col = "gray70", size = 1)
    add_osm_objects (map, dat_T, col = "green")
}

# Highlight a single region using all objects lying partially inside the
# boundary (via the boundary = 1 argument)
pts <- sp::SpatialPoints (cbind (c (-0.115, -0.125, -0.125, -0.115),
                                 c (51.505, 51.505, 51.515, 51.515)))
## Not run: 
##D dat_H <- extract_osm_objects (key = 'highway', bbox = bbox) # all highways
##D map <- bmap ()
##D map <- add_osm_groups (map, dat_BNR, groups = pts, cols = "gray90",
##D                        bg = "gray40", boundary = 1)
##D map <- add_osm_groups (map, dat_H, groups = pts, cols = "gray80",
##D                        bg = "gray30", boundary = 1)
##D print_osm_map (map)
## End(Not run)

# Generate random points to serve as group centres
set.seed (2)
ngroups <- 6
x <- bbox [1,1] + runif (ngroups) * diff (bbox [1,])
y <- bbox [2,1] + runif (ngroups) * diff (bbox [2,])
groups <- cbind (x, y)
groups <- apply (groups, 1, function (i) 
              sp::SpatialPoints (matrix (i, nrow = 1, ncol = 2)))
# plot a basemap and add groups
map <- bmap ()
cols <- rainbow (length (groups))
## Not run: 
##D map <- add_osm_groups (map, obj = london$dat_BNR, group = groups, cols = cols)
##D cols <- adjust_colours (cols, -0.2)
##D map <- add_osm_groups (map, obj = london$dat_H, groups = groups, cols = cols)
##D print_osm_map (map)
##D 
##D # Highlight convex hulls containing groups:
##D map <- bmap ()
##D map <- add_osm_groups (map, obj = london$dat_BNR, group = groups, cols = cols,
##D                        border_width = 2)
##D print_osm_map (map)
## End(Not run)



