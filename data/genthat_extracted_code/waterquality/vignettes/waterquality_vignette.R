## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  echo = TRUE,
  fig.height = 5,
  fig.width = 7
)

## ----worldview2, echo=FALSE----------------------------------------------
worldview_2 = tibble::tribble(
  ~`Band Number`, ~`Band Name`,           ~`Band Center (nm)`,                                  
  1,            "Coastal",                  0.425,                                                 
  2,            "Blue",                     0.480,
  3,            "Green",                    0.545,
  4,            "Yellow",                   0.605,
  5,            "Red",                      0.660,
  6,            "Red Edge",                 0.725,
  7,            "NIR-1",                    0.833,
  8,            "NIR-2",                    0.950 
)

knitr::kable(worldview_2, align = c("l", "r", "r"), caption = "Worldview-2")

## ----sentinel2, echo=FALSE-----------------------------------------------
sentinel_2 = tibble::tribble(
  ~`Band Number`, ~`Band Name`,           ~`Band Center (nm)`,
  1,            "Coastal Blue",             0.443,
  2,            "Blue",                     0.490,
  3,            "Green",                    0.560,
  4,            "Red",                      0.665,
  5,            "Vegetation Red Edge",      0.705,
  6,            "Vegetation Red Edge",      0.740,
  7,            "Vegetation Red Edge",      0.783,
  8,            "NIR",                      0.842,
  9,            "Narrow NIR",               0.865
)

knitr::kable(sentinel_2, align = c("l", "r", "r"), caption = "Sentinel-2")

## ----landsat8, echo=FALSE------------------------------------------------
landsat_8 = tibble::tribble(
  ~`Band Number`, ~`Band Name`,           ~`Band Center (nm)`,
  1,            "Coastal",                  0.443,
  2,            "Blue",                     0.482,
  3,            "Green",                    0.562,
  4,            "Red",                      0.655,
  5,            "NIR",                      0.865,
  6,            "SWIR-1",                   1.609,
  7,            "SWIR-2",                   2.201 
)
knitr::kable(landsat_8, align = c("l", "r", "r"), caption = "Landsat-8")

## ----meris, echo=FALSE---------------------------------------------------
meris = tibble::tribble(
  ~`Band Number`, ~`Band Name`,           ~`Band Center (nm)`,
  1,            "Coastal",                  0.413,
  2,            "Blue",                     0.443,
  3,            "Blue-2",                   0.490,
  4,            "Yellow",                   0.510,
  5,            "Green",                    0.560,
  6,            "Red",                      0.620,
  7,            "Red-2",                    0.665,
  8,            "Chlorophyll_Fl",           0.681,
  9,            "Red-Edge",                 0.709,
  10,           "Red-Edge-2",               0.754,
  11,           "Red-Edge-3",               0.761,
  12,           "Red-Edge-4",               0.779,
  13,           "NIR-1",                    0.865,
  14,           "NIR-2",                    0.885,
  15,           "NIR-3",                    0.900
  )
knitr::kable(meris, align = c("l", "r", "r"), caption = "MERIS")


## ----modis, echo=FALSE---------------------------------------------------
modis = tibble::tribble(
  ~`Band Number`, ~`Band Name`,           ~`Band Center (nm)`,
  1,            "Red",                      0.645,
  2,            "NIR",                      0.859
)
knitr::kable(modis, align = c("l", "r", "r"), caption = "MODIS")

## ---- message=FALSE------------------------------------------------------
library(waterquality)
library(raster)
Harsha <- stack(system.file("raster/S2_Harsha.tif", package = "waterquality"))

## ------------------------------------------------------------------------
Harsha_Am092Bsub <- wq_calc(raster_stack = Harsha, 
                            alg = "Am092Bsub", 
                            sat = "sentinel2")
plot(Harsha_Am092Bsub)

## ------------------------------------------------------------------------
Harsha_Multiple <- wq_calc(raster_stack = Harsha,
                           alg = c("Am092Bsub", "Go04MCI", "Da052BDA"), 
                           sat = "sentinel2")
plot(Harsha_Multiple) 

## ------------------------------------------------------------------------
Harsha_PC <- wq_calc(Harsha,
                     alg = "phycocyanin", 
                     sat = "sentinel2")
plot(Harsha_PC) 

## ------------------------------------------------------------------------
Harsha_All <- wq_calc(Harsha, 
                      alg = "all",
                      sat = "sentinel2")
plot(Harsha_All) # Only displays first 12 of 28

