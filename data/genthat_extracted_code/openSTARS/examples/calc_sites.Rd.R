library(openSTARS)


### Name: calc_sites
### Title: Calculate sites for SSN object.
### Aliases: calc_sites

### ** Examples

## No test: 
# Initiate GRASS session
if(.Platform$OS.type == "windows"){
  gisbase = "c:/Program Files/GRASS GIS 7.4.0"
  } else {
  gisbase = "/usr/lib/grass74/"
  }
initGRASS(gisBase = gisbase,
    home = tempdir(),
    override = TRUE)

# Load files into GRASS
dem_path <- system.file("extdata", "nc", "elev_ned_30m.tif", package = "openSTARS")
sites_path <- system.file("extdata", "nc", "sites_nc.shp", package = "openSTARS")
setup_grass_environment(dem = dem_path)
import_data(dem = dem_path, sites = sites_path)
gmeta()

# Derive streams from DEM
derive_streams(burn = 0, accum_threshold = 700, condition = TRUE, clean = TRUE)

# Check and correct complex junctions (there are no complex juctions in this
# example date set)
cj <- check_compl_junctions()
if(cj){
  correct_compl_junctions()
}

# Prepare edges
calc_edges()

# Prepare site
calc_sites()
# Plot data
dem <- readRAST('dem', ignore.stderr = TRUE)
edges <- readVECT('edges', ignore.stderr = TRUE)
sites <- readVECT('sites', ignore.stderr = TRUE)
sites_o <- readVECT('sites_o', ignore.stderr = TRUE)
plot(dem, col = terrain.colors(20),axes = TRUE)
lines(edges, col = 'blue')
points(sites, pch = 4)
points(sites_o, pch = 1)
legend("topright", pch = c(1, 4), legend = c("original", "corrected"))
## End(No test)



