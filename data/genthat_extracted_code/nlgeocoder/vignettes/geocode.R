## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = " "
)
library(leaflet)
library(sf)
library(nlgeocoder)

## ---- df_print="default"-------------------------------------------------
library(nlgeocoder)

res <- nl_geocode("Martinikerkhof 3 Groningen")
print(res["weergavenaam"])

## ------------------------------------------------------------------------
colnames(res)

## ------------------------------------------------------------------------
locations <- c("Martinikerkhof 3", "st jansstr 4 groningen", "9726AE 4", "9711 ME 1")
res <- nl_geocode(locations)
data.frame(query = locations, result = res$weergavenaam)

## ------------------------------------------------------------------------
res <- nl_geocode("Groningen", type = "gemeente") 
res[c("weergavenaam","type")] 

## ------------------------------------------------------------------------
res <- nl_geocode("Groningen", type = "woonplaats") 
res$weergavenaam
res$type

## ------------------------------------------------------------------------
res <- nl_geocode("Hoofdstraat", fq = "provincienaam:Groningen") 
res$weergavenaam
res$provincienaam

## ------------------------------------------------------------------------
res <- nl_geocode("Martinikerkhof 3 Groningen") 
st_crs(res)["epsg"]

## ------------------------------------------------------------------------
res <- nl_geocode("Martinikerkhof 3 Groningen", output = "rd") 
st_crs(res)["epsg"]

## ------------------------------------------------------------------------
res <- nl_geocode_rd("Martinikerkhof 3 Groningen") 
st_crs(res)["epsg"]

## ------------------------------------------------------------------------
res <- nl_geocode("Martinikerkhof 3 Groningen", output = "data.frame") 
class(res)

## ------------------------------------------------------------------------
data("addresses")

## ---- echo = FALSE-------------------------------------------------------
knitr::kable(addresses)

## ------------------------------------------------------------------------
library(leaflet)
poi_geocoded <- nl_geocode(addresses$Address)

leaflet(width = "100%", height=600) %>% 
  addPdokTiles("gray") %>% 
  addCircleMarkers(data = poi_geocoded, popup = ~weergavenaam)

