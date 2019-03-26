## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "# "
)

library(spatialwidget)
library(jsonlite)
library(sf)
library(geojsonsf)


## ------------------------------------------------------------------------
head( widget_capitals )

## ------------------------------------------------------------------------
js <- spatialwidget::widget_point( data = widget_capitals, fill_colour = "country", legend = TRUE)

substr( js$data, 1, 200 )

## ------------------------------------------------------------------------
substr( js$legend, 1, 100 )

## ------------------------------------------------------------------------
l <- widget_point( widget_capitals[1:2, ], fill_colour = "country", legend = T )

substr( l$data, 1, 200 )

## ------------------------------------------------------------------------
l <- widget_line( widget_roads[1:2, ], stroke_colour = "ROAD_NAME", legend = T )

substr( l$data, 1, 200 )

## ------------------------------------------------------------------------
l <- widget_polygon( widget_melbourne[1:2, ], fill_colour = "AREASQKM16", legend = F)

substr( l$data, 1, 200 )

## ------------------------------------------------------------------------
df <- data.frame(id = 1:5, val = letters[1:5])
data_types <- vapply( df, function(x) class(x)[[1]], "")
data_types

## ------------------------------------------------------------------------
feat1 <- '{"type":"Feature","properties":{"id":1},"geometry":{"type":"Point","coordinates":[0,0]}}'
feat2 <- '{"type":"Feature","properties":{"id":2},"geometry":{"type":"Point","coordinates":[1,1]}}'
geojson <- paste0('[{"type":"FeatureCollection","features":[',feat1,',',feat2,']}]')
sf <- geojsonsf::geojson_sf( geojson )
sf

## ------------------------------------------------------------------------
geo <- geojsonsf::sf_geojson( sf )
geo

## ------------------------------------------------------------------------
geojsonsf::sf_geojson( sf, atomise = TRUE )

## ------------------------------------------------------------------------
js <- '{"type":"Feature","properties":{"id":1,"val":"a"},"geometry":{"type":"MultiPoint","coordinates":[[1,4],[2,5],[3,6]]}}'
sf <- geojsonsf::geojson_sf( js )
geo_down <- spatialwidget:::rcpp_sf_to_geojson_downcast( sf, "geometry" )
jsonlite::prettify( geo_down )

## ------------------------------------------------------------------------
geojson <- spatialwidget:::rcpp_geojson_sf(sf = widget_arcs, geometries = c("origin","destination"))
substr( geojson, 1, 500)

## ------------------------------------------------------------------------
geojson <- spatialwidget:::rcpp_sf_to_geojson_downcast( sf = widget_capitals, geometry_column = "geometry" )
substr( geojson, 1, 500)

## ------------------------------------------------------------------------
feat1 <- '{"type":"Feature","properties":{"id":1},"geometry":{"type":"MultiPoint","coordinates":[[0,0],[2,2],[4,4]]}}'
feat2 <- '{"type":"Feature","properties":{"id":2},"geometry":{"type":"MultiPoint","coordinates":[[1,1],[3,3],[5,5]]}}'
sf1 <- geojsonsf::geojson_sf( feat1 )
sf2 <- geojsonsf::geojson_sf( feat2 )

sf <- cbind( sf1, sf2)

geojson <- spatialwidget:::rcpp_sf_to_geojson_multi_column_downcast( sf = sf, geometries = c("geometry","geometry.1"))
geojson

## ------------------------------------------------------------------------
geojson <- spatialwidget:::rcpp_geojson( sf = widget_capitals, geometry = "geometry")
substr( geojson, 1, 300)

## ------------------------------------------------------------------------
df <- as.data.frame( widget_capitals )
coords <- sf::st_coordinates( widget_capitals )
df[, c("lon","lat")] <- coords
df$geometry <- NULL

geojson <- spatialwidget:::rcpp_geojson_df(df = df, list(geometry = c("lon","lat")) )
substr( geojson, 1, 500 )

## ------------------------------------------------------------------------
df$z <- sample(1:500, size = nrow(df), replace = TRUE )
geojson <- spatialwidget:::rcpp_geojson_dfz( df, geometries = list(geometry = c("lon","lat","z") ) )
substr( geojson, 1, 500 )


