## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  cache = FALSE,
  comment = "#>",
  message = FALSE,
  error = FALSE,
  warning = FALSE,
  fig.path = "README/README-",
  fig.width=7.3,
  fig.height=5,
  out.width = '100%'
)

## ----readme-body, eval=FALSE---------------------------------------------
#  library(trread)
#  library(dplyr)
#  
#  accra_gtfs <- import_gtfs("https://github.com/AFDLab4Dev/AccraMobility/raw/master/GTFS/GTFS_Accra.zip")

## ---- eval=FALSE---------------------------------------------------------
#  attach(accra_gtfs)
#  
#  routes_df %>% inner_join(trips_df, by="route_id") %>%
#    inner_join(stop_times_df) %>%
#      inner_join(stops_df, by="stop_id") %>%
#        group_by(route_long_name) %>%
#          summarise(stop_count=n_distinct(stop_id)) %>%
#    arrange(desc(stop_count))

