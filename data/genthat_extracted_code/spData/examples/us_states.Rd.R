library(spData)


### Name: us_states
### Title: US states polygons
### Aliases: us_states
### Keywords: datasets sf

### ** Examples

if (requireNamespace("sf", quietly = TRUE)) {
  library(sf)
  data(us_states)

  plot(us_states["REGION"])
}



