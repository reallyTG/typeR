## ----setup, include=FALSE------------------------------------------------
set.seed(1)
knitr::opts_chunk$set(
  collapse = TRUE, comment = "#>", message = FALSE, warning = FALSE, error = FALSE, tidy = TRUE
)

## ----pkg_data------------------------------------------------------------
library(rtrek)
st_datasets()

## ----stBooksWiki---------------------------------------------------------
stBooksWiki

## ----st_books_wiki-------------------------------------------------------
st_books_wiki()

## ----st_books_wiki2, eval = FALSE----------------------------------------
#  st_books_wiki("DS9")

## ----stBooks-------------------------------------------------------------
stBooks

## ----stSeries------------------------------------------------------------
stSeries

## ----stTiles-------------------------------------------------------------
stTiles

## ----stGeo---------------------------------------------------------------
stGeo

## ----tile_coords---------------------------------------------------------
id <- "galaxy1"
(d <- st_tiles_data(id))
(d <- tile_coords(d, id))

## ----leaflet, fig.width=8.82, fig.height=5.5, tidy=FALSE-----------------
library(leaflet)
tiles <- st_tiles("galaxy1")
leaflet(d, options = leafletOptions(crs = leafletCRS("L.CRS.Simple"))) %>%
  addTiles(tiles) %>% setView(108, -75, 2) %>%
  addCircleMarkers(lng = ~x, lat = ~y, label = ~loc, color = "white", radius = 20)

## ----tlBooks-------------------------------------------------------------
tlBooks

## ----tlEvents------------------------------------------------------------
tlEvents

## ----tlFootnotes---------------------------------------------------------
tlFootnotes

## ----stapiEntities-------------------------------------------------------
stapiEntities

## ----stapi_safe----------------------------------------------------------
stapi("character", page_count = TRUE)

## ----stapi_search--------------------------------------------------------
stapi("character", page = 2)

## ----stapi_extract-------------------------------------------------------
Q <- "CHMA0000025118"
Q <- stapi("character", uid = Q)

library(dplyr)
Q$episodes %>% select(uid, title, stardateFrom, stardateTo)

## ----stBooks2------------------------------------------------------------
stBooks

