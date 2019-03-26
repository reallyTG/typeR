library(openSTARS)


### Name: calc_prediction_sites
### Title: Calculate prediction sites for 'SSN' object.
### Aliases: calc_prediction_sites

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

calc_edges()
calc_sites()
calc_prediction_sites(predictions = "preds", dist = 2500)

dem <- readRAST('dem', ignore.stderr = TRUE)
sites <- readVECT('sites', ignore.stderr = TRUE)
preds <- readVECT('preds', ignore.stderr = TRUE)
edges <- readVECT('edges', ignore.stderr = TRUE)
plot(dem, col = terrain.colors(20))
lines(edges, col = 'blue', lwd = 2)
points(sites, pch = 4)
points(preds, pch = 19, col = "steelblue")
## End(No test)



