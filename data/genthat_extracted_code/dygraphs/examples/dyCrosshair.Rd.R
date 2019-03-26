library(dygraphs)


### Name: dyCrosshair
### Title: The dyCrosshair plugin draws a crosshair line over the point
###   closest to the mouse when the user hovers over the graph. It has a
###   "direction" option which is provided in the R wrapper function and
###   then forwarded to the plugin using the "options" argument to
###   dyPlugin.
### Aliases: dyCrosshair

### ** Examples

library(dygraphs)
dygraph(ldeaths) %>%
  dyRangeSelector() %>%
  dyCrosshair(direction = "vertical")




