## ---- init, include = FALSE----------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
load("data/my_fetch.RData")
my_fetch_latlon.df = as(my_fetch_latlon, "data.frame")

## ------------------------------------------------------------------------
# Load the fetchR package
library(fetchR)

## ---- eval = FALSE-------------------------------------------------------
#  # Read in the Polygon ESRI shapefile
#  nz_poly_latlon = rgdal::readOGR("nz_polygon")
#  
#  # Ensure it is a SpatialPolygons object
#  is(nz_poly_latlon, "SpatialPolygons")

## ------------------------------------------------------------------------
# Create a data frame with the latitudes, longitudes and names of the
# locations
fetch.df = data.frame(
  lon = c(174.8, 174.2, 168.2),
  lat = c(-36.4, -40.9, -46.7),
  name = c("Kawau Bay", "Chetwode Islands", "Foveaux Strait"))

fetch.df

## ---- eval = FALSE-------------------------------------------------------
#  # Create a SpatialPoints object for the fetch locations
#  fetch_locs = SpatialPoints(fetch.df[, 1:2],
#                                 CRS(proj4string(nz_poly_latlon)))

## ---- eval = FALSE-------------------------------------------------------
#  # Transform the coastline geography and marine locations layers onto the
#  # NZTM2000 coordinate reference system. Note the EPSG for the NZTM2000
#  # projection is 2193.
#  nz_poly_proj = spTransform(nz_poly_latlon, CRS("+init=epsg:2193"))
#  
#  fetch_locs_proj = spTransform(fetch_locs, CRS("+init=epsg:2193"))

## ---- eval = FALSE-------------------------------------------------------
#  # Calculate wind fetch at Kawau Bay, Chetwode Islands and Foveaux Strait
#  my_fetch_proj = fetch(polygon_layer = nz_poly_proj,
#                        site_layer = fetch_locs_proj,
#                        max_dist = 300,
#                        n_directions = 9,
#                        site_names = fetch.df$name)
#  
#  my_fetch_proj

## ---- echo = FALSE-------------------------------------------------------
my_fetch_proj

## ---- eval = FALSE-------------------------------------------------------
#  # Transform back to the original lat/lon coordinates
#  my_fetch_latlon = spTransform(my_fetch_proj, CRS(proj4string(nz_poly_latlon)))
#  
#  # Create a data frame containing the raw data
#  my_fetch_latlon.df = as(my_fetch_latlon, "data.frame")
#  
#  # Show the first 6 rows from the data frame
#  head(my_fetch_latlon.df)

## ---- echo = FALSE-------------------------------------------------------
head(my_fetch_latlon.df)

## ---- eval = FALSE-------------------------------------------------------
#  # Plot the fetch vectors for all the locations with the coastline geography
#  # layer
#  plot(my_fetch_latlon, nz_poly_latlon)

## ---- eval = FALSE-------------------------------------------------------
#  # Or plot the locations individually
#  plot(my_fetch_latlon[[1]])
#  plot(nz_poly_latlon, add = TRUE, col = "lightgrey", border = NA)

## ---- eval = FALSE-------------------------------------------------------
#  # Export the fetch vectors to a KML file. Colour white to increase contrast.
#  kml(my_fetch_latlon, colour = "white")

