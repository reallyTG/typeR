## ----setup, include=FALSE, message=FALSE, results='hide'-----------------
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_chunk$set(message = FALSE)
# knitr::opts_chunk$set(results = 'hide')

## ---- echo = F, out.width = "690px"--------------------------------------
knitr::include_graphics("idea_of_osrmr.jpg")

## ---- eval=FALSE---------------------------------------------------------
#  library(osrmr)
#  
#  # Set the path of your localhost as environment variable
#  Sys.setenv("OSRM_PATH"="C:/OSRM_API5")
#  
#  # start localhost of OSRM
#  run_server("switzerland-latest.osrm")
#  quit_server() # quit the running server
#  

## ---- eval = FALSE-------------------------------------------------------
#  library(osrmr)
#  nearest(lat = 47, lng = 8, api_version = 5, localhost = FALSE)

## ---- eval = FALSE-------------------------------------------------------
#  run_server("switzerland-latest.osrm")
#  nearest(lat = 47, lng = 8, api_version = 5, localhost = TRUE)
#  quit_server()
#  #        lat      lng
#  # 1 47.00008 8.003016
#  

## ---- eval = FALSE-------------------------------------------------------
#  viaroute(lat1 = 47.1, lng1 = 8.1, lat2 = 46.9, lng2 = 8.3, instructions = FALSE,
#           api_version = 5, localhost = FALSE)
#  
#  viaroute(lat1 = 47.1, lng1 = 8.1, lat2 = 46.9, lng2 = 8.3, instructions = TRUE,
#           api_version = 5, localhost = FALSE)

## ---- eval = FALSE-------------------------------------------------------
#  polyline_5 <- rjson::fromJSON(file = "http://router.project-osrm.org/route/v1/driving/8.1,47.1;8.3,46.9?steps=false&geometries=polyline")$routes[[1]]$geometry
#  polyline_6 <- rjson::fromJSON(file = "http://router.project-osrm.org/route/v1/driving/8.1,47.1;8.3,46.9?steps=false&geometries=polyline6")$routes[[1]]$geometry
#  
#  decoded_5 <- decode_geom(polyline_5, precision = 5)
#  decoded_6 <- decode_geom(polyline_6, precision = 6)
#  
#  options(digits = 10)
#  decoded_5[1:5,]
#  decoded_6[1:5,]
#  
#  nrow(decoded_5)
#  nrow(decoded_6)

## ---- eval = FALSE-------------------------------------------------------
#  assertthat::assert_that(all.equal(decoded_5, decoded_6, tolerance = 1e-6))

## ------------------------------------------------------------------------
Sys.unsetenv("OSRM_PATH")

