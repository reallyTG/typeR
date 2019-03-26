## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE----------------------------------------------------------
#  cdec_query(station = c("ccr", "kwk"), dur_code = "h", sensor_num = "25")

## ---- message=FALSE------------------------------------------------------
library(purrr)
library(CDECRetrieve)

stations_of_interest <- c("kwk", "ccr", "bsf")

# 'map' through the stations of interest and apply them to the function
map(stations_of_interest, function(s) {
  cdec_query(station = s, sensor_num = "25", dur_code = "h")
})

## ---- message=FALSE------------------------------------------------------
temp_data <- map_df(stations_of_interest, function(s) {
  cdec_query(station = s, sensor_num = "25", dur_code = "h")
})

head(temp_data)

## ---- message=FALSE, warning=FALSE---------------------------------------
library(ggplot2)

temp_data %>% 
  ggplot(aes(datetime, parameter_value, color=location_id)) + geom_line()

## ---- message=FALSE------------------------------------------------------
# here ~ tells map that this a function, and to interpret '.' as a value
# being passed from the `stations_of_interest`
map_df(stations_of_interest, ~cdec_query(., "25", "h"))

## ------------------------------------------------------------------------
stations_of_interest <- c("ccr", "kwk")
sensors_of_interest <- c("25", "1")
dur_code = "h"

## ---- message=FALSE------------------------------------------------------
pmap_df(list(stations_of_interest, 
             sensors_of_interest, 
             dur_code), ~cdec_query(station = ..1, sensor_num = ..2, dur_code = ..3))

## ---- message=FALSE, warning=FALSE---------------------------------------
cdec_query_hourly <- purrr::partial(cdec_query, dur_code="h")

# we only have to supply two arguments
map2_df(stations_of_interest, sensors_of_interest, 
        ~cdec_query_hourly(station=.x, sensor_num=.y))

## ------------------------------------------------------------------------
stations_of_interest <- c("bsf", "kwk")
sensors_of_interest <- c("25", "27")
dur_code <- "h"

# data frame of all combinations
ins <- expand.grid(x=stations_of_interest, 
                   y=sensors_of_interest, 
                   z=dur_code, 
                   stringsAsFactors = FALSE)

temp_and_turb <- 
  pmap_df(list(ins$x, ins$y, ins$z), ~cdec_query(..1, ..2, ..3))

head(temp_and_turb)

## ---- warning=FALSE------------------------------------------------------
param_names <- c("25" = "Temperature (F)", "27" = "Turbidity (NTU)")
temp_and_turb %>% 
  ggplot(aes(datetime, parameter_value, color=location_id)) + 
  geom_line() + 
  facet_grid(. ~ param_names[parameter_cd], scales = "free")

