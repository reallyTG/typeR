library(inlabru)


### Name: gg.RasterLayer
### Title: Geom for RasterLayer objects
### Aliases: gg.RasterLayer

### ** Examples

# Some features require the raster and spatstat.data packages.
if (require("spatstat.data", quietly = TRUE) &&
    require("raster", quietly = TRUE)) {

# Load Gorilla data
data("gorillas", package = "spatstat.data")

# Convert elevation covariate to RasterLayer

elev = as(gorillas.extra$elevation, "RasterLayer")

# Plot the elevation

ggplot() + gg(elev)

}



