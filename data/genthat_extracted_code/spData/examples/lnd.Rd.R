library(spData)


### Name: lnd
### Title: The boroughs of London
### Aliases: lnd
### Keywords: datasets sf

### ** Examples

if (requireNamespace("sf", quietly = TRUE)) {
  library(sf)
  data(lnd)
  summary(lnd)
  plot(st_geometry(lnd))
}



