library(openSTARS)


### Name: derive_streams
### Title: Derive stream network from DEM.
### Aliases: derive_streams

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
dem <- readRAST('dem', ignore.stderr = TRUE)
sites <- readVECT('sites_o', ignore.stderr = TRUE)
streams <- readVECT('streams_v', ignore.stderr = TRUE)
plot(dem, col = terrain.colors(20))
lines(streams, col = 'blue', lwd = 2)
points(sites, pch = 4)
## End(No test)




