library(openSTARS)


### Name: import_data
### Title: Import data into 'GRASS.'
### Aliases: import_data

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
preds_path <- system.file("extdata", "nc", "landuse.shp", package = "openSTARS")
setup_grass_environment(dem = dem_path)
import_data(dem = dem_path, sites = sites_path, predictor_vector = preds_path)

# Plot data
dem <- readRAST("dem", ignore.stderr = TRUE)
sites_orig <-  readVECT("sites_o", ignore.stderr = TRUE)
lu <- readVECT("landuse", ignore.stderr = TRUE)
plot(dem, col = terrain.colors(20))
plot(dem, col = grey.colors(20))
col <- adjustcolor(c("red", "green", "blue", "yellow"), alpha.f = 0.3)
plot(lu, add = TRUE, col = col[as.numeric(as.factor(lu$landuse))])
legend("top", col = col, pch = 15, 
  legend = as.factor(sort(unique(lu$landuse))), title = "landuse", ncol = 4)
points(sites_orig, pch = 4)

# import additional vector data
fp <-  system.file("extdata", "nc", "pointsources.shp", package = "openSTARS")
execGRASS("v.import", flags = c("overwrite", "quiet"),
parameters = list(
  input = fp,
  output =  "psources",
  extent = "region"),  # to import into current regien
  intern = TRUE, ignore.stderr = TRUE)
  
ps <- readVECT("psources")
points(ps, bg = "red", pch = 21, col = "grey", cex = 1.5)
## End(No test)



