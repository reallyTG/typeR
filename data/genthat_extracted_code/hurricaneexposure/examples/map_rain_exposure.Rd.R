library(hurricaneexposure)


### Name: map_rain_exposure
### Title: Map counties with rain exposure
### Aliases: map_rain_exposure

### ** Examples

# Ensure that data package is available before running the example.
#  If it is not, see the `hurricaneexposure` package vignette for details
# on installing the required data package.
if (requireNamespace("hurricaneexposuredata", quietly = TRUE)) {

map_rain_exposure(storm = "Floyd-1999", rain_limit = 50, dist_limit = 100)

# Example of customizine track appearance
allison_map <- map_rain_exposure(storm = "Allison-2001", rain_limit = 125,
                                 dist_limit = 100, days_included = -5:3,
                                 add_track = FALSE)
map_tracks("Allison-2001", plot_object = allison_map, plot_points = TRUE)
}



