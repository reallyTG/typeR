## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(slippymath)

uluru_bbox <-
    c(xmin = 131.02084,
      xmax = 131.0535,
      ymin = -25.35461,
      ymax = -25.33568)

bbox_tile_query(uluru_bbox)

## ------------------------------------------------------------------------
bbox_to_tile_grid(uluru_bbox, zoom = 14)

## ------------------------------------------------------------------------
bbox_to_tile_grid(uluru_bbox, max_tiles = 15)

## ------------------------------------------------------------------------
lonlat_to_tilenum(131.02084, -25.35461, zoom = 14)

tilenum_to_lonlat(14154, 9385, zoom = 14)

## ------------------------------------------------------------------------
uluru_grid <- bbox_to_tile_grid(uluru_bbox, max_tiles = 15)
tile_grid_bboxes(uluru_grid)

## for a single tile use tg_bb()

## ---- eval=FALSE---------------------------------------------------------
#  raster_out <- compose_tile_grid(tile_grid, images)

## ---- eval=FALSE---------------------------------------------------------
#  raster_to_png(raster_out, "uluru.png")

