## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE----------------------------------------------------------
#  # for stable version
#  install.packages("CDECRetrieve")
#  
#  # for development version
#  devtools::install_github("flowwest/CDECRetrieve")

## ------------------------------------------------------------------------
library(CDECRetrieve)

cdec_stations(station_id = "kwk") # return metadata for KWK

# show all locations near san francisco, this returns a set of 
# CDEC station that are near San Francisco
cdec_stations(nearby_city = "san francisco")

# show all location in the sf bay river basin
cdec_stations(river_basin = "sf bay")

# show all station in Tehama county
cdec_stations(county = "tehama")


## ----eval=FALSE----------------------------------------------------------
#  library(magrittr)
#  library(leaflet)
#  
#  cdec_stations(county = "tehama") %>%
#    map_stations()

## ----eval=FALSE----------------------------------------------------------
#  d <- cdec_stations(county = "tehama")
#  leaflet(d) %>%
#    addTiles() %>%
#    addCircleMarkers(label=~station_id) #psk is way off here

## ------------------------------------------------------------------------
station <- "sha"
cdec_datasets("sha")

## ------------------------------------------------------------------------
library(magrittr)

cdec_datasets("sha") %>% 
  dplyr::filter(grepl("storage", sensor_name))

## ----message=FALSE-------------------------------------------------------
sha_storage_daily <- cdec_query(station = "sha", sensor_num = "15", 
                                dur_code = "d", start_date = "2018-01-01", 
                                end_date = Sys.Date())

sha_storage_daily

## ----warning=FALSE-------------------------------------------------------
library(ggplot2)

sha_storage_daily %>% 
  ggplot(aes(datetime, parameter_value)) + geom_line()

