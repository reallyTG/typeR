library(openSTARS)


### Name: correct_compl_junctions
### Title: Correct junctions with three inflows.
### Aliases: correct_compl_junctions

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
derive_streams(burn = 0, accum_threshold = 100, condition = TRUE, clean = TRUE)

# Check and correct complex junctions (there are complex juctions in the 
# example date set if the accumulation threshold is low)
cj <- check_compl_junctions()
if(cj){
  correct_compl_junctions()
}

# plot
dem <- readRAST('dem', ignore.stderr = TRUE)
streams <- readVECT('streams_v', ignore.stderr = TRUE)
streams_orig <- readVECT('streams_v_o', ignore.stderr = TRUE)
# zoom to a relevant part of the dem
plot(dem, col = terrain.colors(20), axes = TRUE, 
  xlim = c(640050,640200), ylim = c(219700,219850))
lines(streams_orig, col = 'red', lwd = 4)
lines(streams, col = 'blue', lty = 2, lwd = 2)
legend("topright", col = c("red", "blue"), lty = c(1,2), lwd = c(4,2), 
  legend = c("original", "corrected"))
## End(No test)



