## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----load_libraries_hidden, eval=TRUE, echo=FALSE, message=FALSE, results='hide'----
library(landscapemetrics)
library(raster)
library(dplyr)

## ------------------------------------------------------------------------
# import raster
# for local file: raster("pathtoyourraster/raster.asc")
# ... or any other raster file type, geotiff, ...

# Check your landscape
check_landscape(landscapemetrics::landscape) # because CRS is unkown, not clear

check_landscape(landscapemetrics::podlasie_ccilc) # wrong units

check_landscape(landscapemetrics::augusta_nlcd) # everything is ok

## ---- message=FALSE------------------------------------------------------
# import raster
# for local file: raster("pathtoyourraster/raster.asc")
# ... or any other raster file type, geotiff, ...

# Calculate e.g. perimeter of all patches
lsm_p_perim(landscape)

## ---- message=FALSE------------------------------------------------------
# all patch IDs of class 2 with an ENN > 2.5
subsample_patches <- landscape %>% 
    lsm_p_enn() %>%
    dplyr::filter(class == 2 & value > 2.5) %>%
    dplyr::pull(id)

# show results
subsample_patches

## ------------------------------------------------------------------------
# list all available metrics
list_lsm()

# list only aggregation metrics at landscape level and just return function name
list_lsm(level = "landscape", 
         type = "aggregation metric", 
         simplify = TRUE)

# you can also combine arguments and only return the function names
list_lsm(level = c("patch", "landscape"), 
         type = "core area metric", 
         simplify = TRUE)

## ---- message=FALSE------------------------------------------------------
# bind results from different metric functions
patch_metrics <- dplyr::bind_rows(
  lsm_p_cai(landscape),
  lsm_p_circle(landscape),
  lsm_p_enn(landscape)
)

# look at the results
patch_metrics 

## ---- message=FALSE------------------------------------------------------

# bind results from different metric functions
patch_metrics <- dplyr::bind_rows(
  lsm_p_cai(landscape),
  lsm_p_circle(landscape),
  lsm_p_enn(landscape)
  )
# look at the results
patch_metrics_full_names <- dplyr::left_join(x = patch_metrics,
                                             y = lsm_abbreviations_names, 
                                             by = "metric")
patch_metrics_full_names

## ---- message=FALSE------------------------------------------------------
# calculate certain metrics
calculate_lsm(landscape, 
              what = c("lsm_c_pland", "lsm_l_ta", "lsm_l_te"))

# calculate all aggregation metrics on patch and landscape level
calculate_lsm(landscape, 
              type = "aggregation metric", 
              level = c("patch", "landscape"))

# show full information of all metrics
calculate_lsm(landscape, 
              what = c("lsm_c_pland", "lsm_l_ta", "lsm_l_te"),
              full_name = TRUE)

