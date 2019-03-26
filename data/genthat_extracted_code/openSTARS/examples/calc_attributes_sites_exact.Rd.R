library(openSTARS)


### Name: calc_attributes_sites_exact
### Title: Calculate attributes of the sites.
### Aliases: calc_attributes_sites_exact

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

# Prepare edges
calc_edges()
execGRASS("r.slope.aspect", flags = c("overwrite","quiet"),
          parameters = list(
            elevation = "dem",
            slope = "slope"
          ))
calc_attributes_edges(input_raster = "slope", stat_rast = "max", attr_name_rast = "maxSlo")

# Prepare sites
calc_sites()
calc_attributes_sites_approx(input_attr_name = "maxSlo", output_attr_name = "maxSloA", stat = "max")
calc_attributes_sites_exact(input_raster = "slope", attr_name_rast = "maxSloE", stat_rast = "max")

# Plot data
dem <- readRAST('dem', ignore.stderr = TRUE)
edges <- readVECT('edges', ignore.stderr = TRUE)
sites <- readVECT('sites', ignore.stderr = TRUE)
plot(dem, col = gray(seq(0,1,length.out=20)))
mm <- range(c(edges$maxSlo_e, sites$maxSloA, sites$maxSloE))
b <- seq(from = mm[1], to = mm[2] + diff(mm) * 0.01, length.out = 10)
c_ramp <- colorRampPalette(c("white", "blue", "orange", "red"))
cols <- c_ramp(length(b))[as.numeric(cut(edges$maxSlo_e, breaks = b, right = FALSE))]
plot(edges,col = cols, lwd = 2, add = TRUE)
cols <- c_ramp(length(b))[as.numeric(cut(sites$maxSloA,breaks = b,right = FALSE))]
plot(sites, pch = 19, col = cols, cex = 2, add = TRUE)
cols <- c_ramp(length(b))[as.numeric(cut(sites$maxSloE,breaks = b,right = FALSE))]
plot(sites, pch = 21, bg = cols, cex = 1.1, add = TRUE)
# Some points in the lower centre of the map indicate a difference in max slope between
# approximate and exact calculation (different colors for inner and outer points)
## End(No test)



