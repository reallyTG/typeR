library(spData)


### Name: baltimore
### Title: House sales prices, Baltimore, MD 1978
### Aliases: baltimore
### Keywords: datasets sf

### ** Examples

data(baltimore)
str(baltimore)

if (requireNamespace("sf", quietly = TRUE)) {
  library(sf)
  baltimore_sf <- baltimore %>% st_as_sf(., coords = c("X","Y"))
  plot(baltimore_sf["PRICE"])
}



