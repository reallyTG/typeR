## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

# load the library
library(foto)
library(raster)


## ----figure_1, message = FALSE, warning = FALSE, fig.width=7, fig.height=7----
library(foto)

# load demo data
r <- raster::raster(sprintf("%s/extdata/yangambi.png", path.package("foto")))

# classify pixels using zones (discrete steps)
output <- foto(r,
     plot = TRUE,
     window_size = 25,
     method = "zones")

# print data structure
print(names(output))

## ----figure_2, fig.width=7, fig.height=7---------------------------------
# crop the image for speed
r <- crop(r, extent(1,100,1,100))

# crop the image
output <- foto(r,
     plot = TRUE,
     window_size = 25,
     method = "mw")

# print data structure
print(names(output))

