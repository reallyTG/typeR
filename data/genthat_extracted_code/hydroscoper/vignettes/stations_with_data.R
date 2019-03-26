## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----load_library--------------------------------------------------------
library(hydroscoper)
library(tibble)
library(ggplot2)

## ----stations_data-------------------------------------------------------
stations

## ----timeseries_data-----------------------------------------------------
timeseries

## ----all_stations--------------------------------------------------------
ggplot() + 
  geom_polygon(data = greece_borders,
               aes(long, lat, group = group),
               fill = "grey",
               color = NA) +
  geom_point(data = stations,
             aes(x = longitude, y = latitude, color = subdomain)) +
  scale_color_manual(values=c("#E64B35FF", "#4DBBD5FF", "#00A087FF", 
                              "#3C5488FF"))+
  coord_fixed(ratio=1) +
  theme_bw()

## ----stations_with_timeseries--------------------------------------------
stations_ts <- subset(stations, station_id %in% timeseries$station_id &
                        subdomain %in% c("kyy", "ypaat"))


ggplot() + 
  geom_polygon(data = greece_borders,
               aes(long, lat, group = group),
               fill = "grey",
               color = NA) +
  geom_point(data = stations_ts,
             aes(x = longitude, y = latitude, color = subdomain)) +
  scale_color_manual(values=c("#00A087FF", "#3C5488FF"))+
  coord_fixed(ratio=1) +
  theme_bw()

