library(ggvis)


### Name: subvis
### Title: Create a subvisualisation.
### Aliases: subvis
### Keywords: internal

### ** Examples

# Examples don't work yet
## Not run: 
##D library(dplyr, warn.conflicts = FALSE)
##D 
##D small <- nasaweather::atmos %>%
##D   filter(lat <= -11.217391, long <= -106.287, year == 1995) %>%
##D   group_by(long, lat)
##D small %>%
##D   ggvis(~long, ~lat) %>%
##D   layer_points()
##D 
##D small %>%
##D   ggvis(~long, ~lat) %>%
##D   subvis(width := 100, height := 100, stroke := "red") %>%
##D     layer_points(~month, ~ozone)
##D 
##D small %>%
##D   ggvis(~long, ~lat) %>%
##D   subvis(width := 100, height := 100, stroke := "red") %>%
##D     layer_points(~month, ~ozone) %>%
##D     add_axis("x", ticks = 3) %>%
##D     add_axis("y", ticks = 3)
## End(Not run)



