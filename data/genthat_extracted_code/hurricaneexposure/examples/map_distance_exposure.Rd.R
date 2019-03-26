library(hurricaneexposure)


### Name: map_distance_exposure
### Title: Map counties with distance exposure
### Aliases: map_distance_exposure

### ** Examples

# Ensure that data package is available before running the example.
#  If it is not, see the `hurricaneexposure` package vignette for details
# on installing the required data package.
if (requireNamespace("hurricaneexposuredata", quietly = TRUE)) {


floyd_map <- map_distance_exposure(storm = "Floyd-1999", dist_limit = 75)
floyd_map

allison_map <- map_distance_exposure(storm = "Allison-2001",
                                     dist_limit = 75)
map_tracks("Allison-2001", plot_points = FALSE, plot_object = allison_map)
}



