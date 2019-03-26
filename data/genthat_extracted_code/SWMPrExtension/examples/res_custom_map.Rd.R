library(SWMPrExtension)


### Name: res_custom_map
### Title: Local Reserve Map for Custom Stations
### Aliases: res_custom_map

### ** Examples

### set plotting parameters
stns <- c('custom stn 1', 'custom stn 2')
x_coords <- c(-121.735281, -121.750369)
y_coords <- c(36.850377, 36.806667)
shp_fl <- elk_spatial
bounding_elk <- c(-121.810978, 36.868218, -121.708667, 36.764050)
lab_dir <- c('L', 'R')
pos <- 'bottomleft'

### plot
res_custom_map(stations = stns, x_loc = x_coords, y_loc = y_coords,
bbox = bounding_elk, lab_loc = lab_dir, scale_pos = pos, shp = shp_fl)

## Not run: 
##D res_custom_map(stations = stns, x_loc = x_coords, y_loc = y_coords,
##D bbox = bounding_elk, lab_loc = lab_dir, scale_pos = pos,
##D shp = shp_fl, station_col = c('red', 'green'))
## End(Not run)




