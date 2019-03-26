## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(slippymath)

tibrogargan<- c(xmin = 152.938485, ymin = -26.93345, xmax = 152.956467, 
               ymax = -26.921463)

slippymath::bbox_tile_query(tibrogargan)


## ------------------------------------------------------------------------
tibrogargan_grid <- bbox_to_tile_grid(tibrogargan,zoom = 15)

## ---- eval=FALSE---------------------------------------------------------
#  library(glue)
#  library(purrr)
#  library(curl)
#  
#  mapbox_query_string <-
#  paste0("https://api.mapbox.com/v4/mapbox.terrain-rgb/{zoom}/{x}/{y}.jpg90",
#         "?access_token=",
#         Sys.getenv("MAPBOX_API_KEY"))
#  
#  tibro_tiles <-
#  pmap(.l = tibrogargan_grid$tiles,
#       zoom = tibrogargan_grid$zoom,
#  
#       .f = function(x, y, zoom){
#         outfile <- glue("{x}_{y}.jpg")
#         curl_download(url = glue(mapbox_query_string),
#              destfile = outfile)
#         outfile
#       }
#       )

## ---- eval=FALSE---------------------------------------------------------
#  tibrogargan_raster <- slippymath::compose_tile_grid(tibrogargan_grid, tibro_tiles)
#  raster::plot(tibrogargan_raster)

## ---- eval=FALSE---------------------------------------------------------
#  
#  decode_elevation <- function(dat) {
#    height <-  -10000 + ((dat[[1]] * 256 * 256 + dat[[2]] * 256 + dat[[3]]) * 0.1)
#    raster::projection(height) <- "+proj=merc +a=6378137 +b=6378137"
#    height
#  }

## ---- eval=FALSE---------------------------------------------------------
#  tibrogargan_elevation <- decode_elevation(tibrogargan_raster)
#  raster::plot(tibrogargan_elevation)
#  

## ---- eval=FALSE---------------------------------------------------------
#  library(magrittr)
#  library(rayshader)
#  
#  elevation_mat <- t(raster::as.matrix(tibrogargan_elevation))
#  
#  shadow_mat <- ray_shade(elevation_mat)
#  
#  elevation_mat %>%
#    sphere_shade(progbar = FALSE, sunangle = 45) %>%
#    add_shadow(shadow_mat) %>%
#    plot_3d(elevation_mat,
#            zscale = 7,
#            phi = 30,
#            theta = 135)

## ---- eval=FALSE---------------------------------------------------------
#  library(quadmesh)
#  
#  elevation_mesh <- quadmesh(tibrogargan_elevation)
#  rgl::shade3d(elevation_mesh, col = "light green")

