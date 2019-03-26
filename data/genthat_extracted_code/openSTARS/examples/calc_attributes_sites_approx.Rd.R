library(openSTARS)


### Name: calc_attributes_sites_approx
### Title: Calculate attributes of the sites.
### Aliases: calc_attributes_sites_approx

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
pred_path <- system.file("extdata", "nc", "landuse.shp", package = "openSTARS")
setup_grass_environment(dem = dem_path)
import_data(dem = dem_path, sites = sites_path,
 predictor_vector = pred_path, predictor_v_names = "landuse")
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

# Derive slope from the DEM as an example raster map to calculate attributes from
execGRASS("r.slope.aspect", flags = c("overwrite","quiet"),
parameters = list(
  elevation = "dem",
    slope = "slope"
    ))
calc_attributes_edges(input_raster = "slope", stat_rast = "max", attr_name_rast = "maxSlo",
                     input_vector = "landuse", stat_vect = "percent", attr_name_vect = "landuse")

calc_sites() 
 
# approximate potential predictor variables for each site based on edge values
calc_attributes_sites_approx(input_attr_name = c("maxSlo", "agri", "forest", "grass", "urban"), 
  output_attr_name = c("maxSloA", "agriA", "forestA", "grassA", "urbanA"),
  stat = c("max", rep("percent", 4)))

# Plot data with maximum slope per edge as color ramp (steep slopes in red)
dem <- readRAST('dem', ignore.stderr = TRUE)
edges <- readVECT('edges', ignore.stderr = TRUE)
sites <- readVECT('sites', ignore.stderr = TRUE)
lu <- readVECT("landuse", ignore.stderr = TRUE)
plot(dem, col = gray(seq(0,1,length.out=20))) 
col <- adjustcolor(c("red", "green", "blue", "yellow"), alpha.f = 0.3)
plot(lu, add = TRUE, col = col[as.numeric(as.factor(lu$landuse))])
 mm <- range(c(edges$agri_c), na.rm = TRUE) 
b <- seq(from=mm[1],to=mm[2]+diff(mm)*0.01,length.out=10)
c_ramp <- colorRampPalette(c("blue", "red"))
cols <- c_ramp(length(b))[as.numeric(cut(edges$agri_c, breaks = b, right = FALSE))]
plot(edges,col=cols, add = TRUE , lwd=2)
mm <- range(c(sites$agriA), na.rm = TRUE) 
b <- seq(from=mm[1],to=mm[2]+diff(mm)*0.01,length.out=10)
c_ramp <- colorRampPalette(c("blue", "red"))
cols <- c_ramp(length(b))[as.numeric(cut(sites$agriA, breaks = b, right = FALSE))]
plot(sites ,col=cols, add = TRUE, pch = 19)
legend("topleft", col = col, pch = 15, legend = as.factor(sort(unique(lu$landuse))), 
  title = "landuse", ncol = 4)
legend("topright", col = cols[c(1, length(cols))], lwd = 2, 
  legend = paste("precent agri", c(min(sites$agriA), max(sites$agriA))), pch = 19)
## End(No test)
                 



