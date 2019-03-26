## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----message=FALSE, warning=FALSE----------------------------------------
library(nhdR)
library(dplyr)
library(ggplot2)
library(sf)

## ----mendota_centroid, warning=FALSE, eval=TRUE--------------------------
data(mendota)

largest_waterbody <- which.max(st_area(mendota$sp$NHDWaterbody))
mendota_lake      <- mendota$sp$NHDWaterbody[largest_waterbody,]
mendota_lake      <- st_transform(mendota_lake, crs = 4326)
mendota_centroid  <- st_coordinates(st_centroid(mendota_lake))

## ----mendota_network, eval=FALSE-----------------------------------------
#  mendota_network <- extract_network(lon = mendota_centroid[1],
#                                  lat = mendota_centroid[2],
#                                  maxsteps = Inf)

## ----use_precomputed_data, echo=FALSE------------------------------------
data(mendota_network)

## ----mapping-------------------------------------------------------------
ggplot() + 
  geom_sf(data = mendota$sp$NHDFlowLine) +
  geom_sf(data = mendota_lake, fill = "cyan") +
  geom_sf(data = mendota_network, color = "blue")


