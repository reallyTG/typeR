## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=FALSE---------------------------------------------------------
#  library(leaflet)
#  library(leaflet.opacity)
#  library(raster)

## ---- eval=FALSE---------------------------------------------------------
#  r <- raster(xmn = -2.8, xmx = -2.79, ymn = 54.04, ymx = 54.05, nrows = 30, ncols = 30)
#  values(r) <- matrix(1:900, nrow(r), ncol(r), byrow = TRUE)
#  crs(r) <- CRS("+init=epsg:4326")

## ---- eval=FALSE---------------------------------------------------------
#  leaflet() %>%
#      addTiles() %>%
#      addRasterImage(r, layerId = "raster") %>%
#      addOpacitySlider(layerId = "raster")

