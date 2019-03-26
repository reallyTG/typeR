## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(airportr)

## ------------------------------------------------------------------------
airport_lookup("YVR", input_type = "IATA", output_type = "name")

## ------------------------------------------------------------------------
airport_lookup("Vancouver International Airport", input_type = "name", output_type ="IATA")

## ------------------------------------------------------------------------
airport_lookup("YVR", output_type = "city")

## ------------------------------------------------------------------------
airport_detail("YVR")

## ------------------------------------------------------------------------
airport_location("CYVR", input_type = "ICAO")

## ------------------------------------------------------------------------
# Display all airports serving a given city
city_airports("Vancouver")

## ------------------------------------------------------------------------
airport_distance("YVR","LHR")

## ------------------------------------------------------------------------
airports_near_airport("YEG")

## ------------------------------------------------------------------------
airports_around(lat = 49.2, lon = -123, distance = 20)

