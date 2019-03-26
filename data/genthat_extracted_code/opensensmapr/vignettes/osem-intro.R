## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----results = F---------------------------------------------------------
library(magrittr)
library(opensensmapr)

all_sensors = osem_boxes()

## ------------------------------------------------------------------------
summary(all_sensors)

## ----message=F, warning=F------------------------------------------------
if (!require('maps'))     install.packages('maps')
if (!require('maptools')) install.packages('maptools')
if (!require('rgeos'))    install.packages('rgeos')

plot(all_sensors)

## ------------------------------------------------------------------------
phenoms = osem_phenomena(all_sensors)
str(phenoms)

## ------------------------------------------------------------------------
phenoms[phenoms > 20]

## ----results = F---------------------------------------------------------
pm25_sensors = osem_boxes(
  exposure = 'outdoor',
  date = Sys.time(), # ±4 hours
  phenomenon = 'PM2.5'
)

## ------------------------------------------------------------------------
summary(pm25_sensors)
plot(pm25_sensors)

## ------------------------------------------------------------------------
library(sf)
library(units)
library(lubridate)
library(dplyr)

# construct a bounding box: 12 kilometers around Berlin
berlin = st_point(c(13.4034, 52.5120)) %>%
  st_sfc(crs = 4326) %>%
  st_transform(3857) %>% # allow setting a buffer in meters
  st_buffer(set_units(12, km)) %>%
  st_transform(4326) %>% # the opensensemap expects WGS 84
  st_bbox()

## ----results = F---------------------------------------------------------
pm25 = osem_measurements(
  berlin,
  phenomenon = 'PM2.5',
  from = now() - days(3), # defaults to 2 days
  to = now()
)

plot(pm25)

## ------------------------------------------------------------------------
outliers = filter(pm25, value > 100)$sensorId
bad_sensors = outliers[, drop = T] %>% levels()

pm25 = mutate(pm25, invalid = sensorId %in% bad_sensors)

## ------------------------------------------------------------------------
st_as_sf(pm25) %>% st_geometry() %>% plot(col = factor(pm25$invalid), axes = T)

## ------------------------------------------------------------------------
pm25 %>% filter(invalid == FALSE) %>% plot()

