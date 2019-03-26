library(openSTARS)


### Name: setup_grass_environment
### Title: Setup 'GRASS' environment.
### Aliases: setup_grass_environment

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
setup_grass_environment(dem = dem_path)
gmeta()
## End(No test)



