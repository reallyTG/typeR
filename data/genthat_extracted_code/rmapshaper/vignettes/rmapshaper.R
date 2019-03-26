## ------------------------------------------------------------------------
library(geojsonio)
library(rmapshaper)
library(sp)

states_json <- geojson_json(states, geometry = "polygon", group = "group")

## ------------------------------------------------------------------------
states_sp <- geojson_sp(states_json)

## Plot the original
plot(states_sp)

## ------------------------------------------------------------------------
states_simp <- ms_simplify(states_sp)
plot(states_simp)

## ------------------------------------------------------------------------
states_very_simp <- ms_simplify(states_sp, keep = 0.001)
plot(states_very_simp)

## ------------------------------------------------------------------------
library(rgeos)
states_gsimp <- gSimplify(states_sp, tol = 1, topologyPreserve = TRUE)
plot(states_gsimp)

## ------------------------------------------------------------------------
library(sf)
states_sf <- st_as_sf(states_sp)
states_sf_innerlines <- ms_innerlines(states_sf)
plot(states_sf_innerlines)

## ------------------------------------------------------------------------
library(geojsonio)
library(rmapshaper)
library(sp)
library(magrittr)

## First convert 'states' dataframe from geojsonio pkg to json
states_json <- geojson_json(states, lat = "lat", lon = "long", group = "group", 
                            geometry = "polygon")

states_json %>% 
  ms_erase(bbox = c(-107, 36, -101, 42)) %>% # Cut a big hole in the middle
  ms_dissolve() %>% # Dissolve state borders
  ms_simplify(keep_shapes = TRUE, explode = TRUE) %>% # Simplify polygon
  geojson_sp() %>% # Convert to SpatialPolygonsDataFrame
  plot(col = "blue") # plot

## ----eval=nzchar(Sys.which("mapshaper"))---------------------------------
check_sys_mapshaper()

## ----eval=nzchar(Sys.which("mapshaper"))---------------------------------
states_simp_internal <- ms_simplify(states_sf)
states_simp_sys <- ms_simplify(states_sf, sys = TRUE)

all.equal(states_simp_internal, states_simp_sys)

