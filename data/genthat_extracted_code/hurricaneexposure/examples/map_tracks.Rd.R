library(hurricaneexposure)


### Name: map_tracks
### Title: Plot Atlantic basin hurricane tracks
### Aliases: map_tracks

### ** Examples

# Ensure that data package is available before running the example.
#  If it is not, see the `hurricaneexposure` package vignette for details
# on installing the required data package.
if (requireNamespace("hurricaneexposuredata", quietly = TRUE)) {

map_tracks(storms = "Sandy-2012")
map_tracks(storms = "Floyd-1999", plot_points = TRUE)
map_tracks(storms = c("Sandy-2012", "Floyd-1999"))
a <- map_tracks(storms = "Sandy-2012", color = "blue", alpha = 0.3)
b <- map_tracks(storms = "Floyd-1999", plot_object = a)
b
}



