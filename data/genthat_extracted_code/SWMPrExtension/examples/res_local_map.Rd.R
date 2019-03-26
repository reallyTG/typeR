library(SWMPrExtension)


### Name: res_local_map
### Title: Local Reserve Map
### Aliases: res_local_map

### ** Examples

## a compact reserve
### set plotting parameters
stations <-
sampling_stations[(sampling_stations$NERR.Site.ID == 'elk'
& sampling_stations$Status == 'Active'), ]$Station.Code
to_match <- c('wq', 'met')
stns <- stations[grep(paste(to_match, collapse = '|'), stations)]
shp_fl <- elk_spatial
bounding_elk <- c(-121.810978, 36.868218, -121.708667, 36.764050)
lab_dir <- c('L', 'R', 'L', 'L', 'L')
labs <- c('ap', 'cw', 'nm', 'sm', 'vm')
pos <- 'bottomleft'

### plot
res_local_map('elk', stations = stns, bbox = bounding_elk,
lab_loc = lab_dir, scale_pos = pos, shp = shp_fl)

## Not run: 
##D ## a multicomponent reserve (show two different bounding boxes)
##D ### set plotting parameters
##D stations <-
##D sampling_stations[(sampling_stations$NERR.Site.ID == 'cbm'
##D & sampling_stations$Status == 'Active'), ]$Station.Code
##D to_match <- c('wq', 'met')
##D stns <- stations[grep(paste(to_match, collapse = '|'), stations)]
##D shp_fl <- cbm_spatial
##D bounding_cbm_1 <- c(-77.393, 39.741, -75.553, 38.277)
##D bounding_cbm_2 <- c(-76.862006, 38.811571, -76.596508, 38.642454)
##D lab_dir <- c('L', 'R', 'L', 'L', 'L')
##D labs <- c('ap', 'cw', 'nm', 'sm', 'vm')
##D pos <- 'bottomleft'
##D 
##D ### plot
##D res_local_map('cbm', stations = stns, bbox = bounding_cbm_1,
##D lab_loc = lab_dir, scale_pos = pos, shp = shp_fl)
##D 
##D res_local_map('cbm', stations = stns, bbox = bounding_cbm_2,
##D lab_loc = lab_dir, scale_pos = pos, shp = shp_fl)
##D 
## End(Not run)




