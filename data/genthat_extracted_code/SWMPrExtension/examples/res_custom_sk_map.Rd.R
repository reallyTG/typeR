library(SWMPrExtension)


### Name: res_custom_sk_map
### Title: Local Reserve Map With Seasonal Kendall Results for Custom
###   Stations
### Aliases: res_custom_sk_map

### ** Examples

### set plotting parameters
stns <- c('custom stn 1', 'custom stn 2')
x_coords <- c(-121.735281, -121.750369)
y_coords <- c(36.850377, 36.806667)
shp_fl <- elk_spatial
bounding_elk <- c(-121.810978, 36.868218, -121.708667, 36.764050)
lab_dir <- c('R', 'L')
trnds <- c('inc', 'dec')
pos <- 'bottomleft'

### plot
res_custom_sk_map(stations = stns, x_loc = x_coords,
sk_result = trnds, y_loc = y_coords,
bbox = bounding_elk, lab_loc = lab_dir,
scale_pos = pos, shp = shp_fl)




