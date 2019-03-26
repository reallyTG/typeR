## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  warning = FALSE,
  comment = "#>"
)

## ----setup---------------------------------------------------------------
library(grainchanger)
library(ggplot2)
library(landscapetools)

## ----mwda_example, fig.show='hold'---------------------------------------
g_sf$mwda <- winmove_agg(
  g = g_sf,
  dat = cat_ls, 
  d = 5,
  type = "rectangle",
  fun = "shei",
  lc_class = 0:3
)

show_landscape(cat_ls)

ggplot(g_sf) + geom_sf(aes(fill = mwda))

## ----dda_example, fig.show='hold'----------------------------------------
g_sf$range <- nomove_agg(
  g = g_sf,
  dat = cat_ls, 
  fun = "var_range")

show_landscape(cont_ls)

ggplot(g_sf) + geom_sf(aes(fill = range))

## ----functions, echo = FALSE---------------------------------------------
function_overview <- data.frame(
  `Function Name` = c("wm_prop", "wm_classes", "wm_shei", "wm_mean", "nm_shei", "nm_prop", "var_range"),
  `Description` = c("Calculate the proportion of a given class within the moving window", 
                    "Calculate the number of classes within the moving window",
                    "Calculate the Shannon evenness within the moving window", 
                    "Calculate the mean value within the moving window", 
                    "Calculate the Shannon evenness within the larger cell",
                    "Calculate the proportion of a given class within the larger cell",
                    "Calculate the range of values (can be used with or without a moving window"),
  `Additional arguments` = c("lc_class (numeric)", 
                             "",
                             "lc_class (numeric)",
                             "", 
                             "lc_class (numeric)",
                             "lc_class (numeric)",
                             "")
)

knitr::kable(function_overview)

## ----torus---------------------------------------------------------------
torus <- create_torus(cat_ls, 5)

landscapetools::show_landscape(torus)

