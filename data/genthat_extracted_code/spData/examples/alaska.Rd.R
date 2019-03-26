library(spData)


### Name: alaska
### Title: Alaska multipolygon
### Aliases: alaska
### Keywords: datasets sf

### ** Examples

if (requireNamespace("sf", quietly = TRUE)) {
  library(sf)
  data(alaska)

  plot(alaska["total_pop_15"])
}



