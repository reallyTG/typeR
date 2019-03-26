library(spData)


### Name: hawaii
### Title: Hawaii multipolygon
### Aliases: hawaii
### Keywords: datasets sf

### ** Examples

if (requireNamespace("sf", quietly = TRUE)) {
  library(sf)
  data(hawaii)

  plot(hawaii["total_pop_15"])
}



