## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  fig.asp = 1 / 1.6,
  out.width = "75%",
  fig.width = 5,
  fig.retina = NULL,
  dpi = 96,
  collapse = TRUE,
  comment = "#>"
)

library(kableExtra)
library(httptest)

path <- here::here("vignettes/introduction")

httptest::start_vignette(path = path)

## ------------------------------------------------------------------------
library(echor)
meta <- echoAirGetMeta()
meta

## ------------------------------------------------------------------------
library(echor)

## Retrieve information about facilities within a geographic location
df <- echoAirGetFacilityInfo(output = "df",
                             xmin = '-96.387509',
                             ymin = '30.583572',
                             xmax = '-96.281422',
                             ymax = '30.640008',
                             qcolumns = "1,2,3,22,23")

## ----echo=FALSE, message=FALSE, warning=FALSE----------------------------
knitr::kable(head(df), "html") %>%
  kable_styling() %>%
  scroll_box(width = "500px", height = "200px")

## ------------------------------------------------------------------------
df <- echoGetCAAPR(p_id = '110000350174')

## ----echo=FALSE----------------------------------------------------------
knitr::kable(head(df), "html") %>%
  kable_styling() %>%
  scroll_box(width = "500px", height = "200px")

## ------------------------------------------------------------------------
df <- echoWaterGetFacilityInfo(xmin = '-96.407563', ymin = '30.554395', 
                               xmax = '-96.25947',  ymax = '30.751984', 
                               output = 'df')

## ----echo=FALSE----------------------------------------------------------
knitr::kable(head(df), "html") %>%
  kable_styling() %>%
  scroll_box(width = "500px", height = "200px")

## ------------------------------------------------------------------------
df <- echoGetEffluent(p_id = 'tx0119407', parameter_code = '50050')

## ----echo=FALSE----------------------------------------------------------
knitr::kable(head(df), "html") %>%
  kable_styling() %>%
  scroll_box(width = "500px", height = "200px")

## ------------------------------------------------------------------------
echoWaterGetParams(term = "Oxygen, dissolved")

## ----eval=FALSE, message=FALSE, warning=FALSE, paged.print=FALSE---------
#  ## Sample code only,
#  ## This example requires the development
#  ## version of ggplot2 with support for
#  ## geom_sf()
#  
#  library(ggplot2)
#  library(ggmap)
#  library(dplyr)
#  library(purrr)
#  library(sf)
#  library(ggrepel)
#  
#  ## Download data as a simple feature
#  df <- echoWaterGetFacilityInfo(xmin = '-96.407563', ymin = '30.554395',
#                                          xmax = '-96.25947', ymax = '30.751984',
#                                          output = 'sf')
#  ## Download a basemap with gg_map
#  collegestation <- get_map(location = c(-96.387509, 30.583572,
#                                         -96.281422, 30.640008),
#                            zoom = 14, maptype = "toner")
#  
#  ## Use coordinates to create label locations
#  df <- df %>%
#    mutate(
#      coords = map(geometry, st_coordinates),
#      coords_x = map_dbl(coords, 1),
#      coords_y = map_dbl(coords, 2)
#    )
#  
#  ## Make the map
#  ggmap(collegestation) +
#    geom_sf(data = df, inherit.aes = FALSE, shape = 21,
#            color = "darkred", fill = "darkred",
#            size = 2, alpha = 0.25) +
#    geom_label_repel(data = df, aes(x = coords_x, y = coords_y, label = SourceID),
#                     point.padding = .5, min.segment.length = 0.1,
#                     size = 2, color = "dodgerblue") +
#    labs(x = "Longitude", y = "Latitude",
#         title = "NPDES permits near Texas A&M",
#         caption = "Source: EPA ECHO database")

## ----include = FALSE-----------------------------------------------------
httptest::end_vignette()

