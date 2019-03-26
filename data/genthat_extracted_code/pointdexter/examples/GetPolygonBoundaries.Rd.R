library(pointdexter)


### Name: GetPolygonBoundaries
### Title: Obtains the boundaries of the polygon(s)
### Aliases: GetPolygonBoundaries

### ** Examples

## SpatialPolygonsDataFrame, one polygon example ## -----

# load necessary data ----
data("city_boundary_spdf")

# obtain boundaries for the City of Chicago ----
boundaries <-
  GetPolygonBoundaries(my.polygon = city_boundary_spdf)


## SpatialPolygonsDataFrame, multipolygon polygon example ## -----

# load necessary data ----
data("community_areas_spdf")

# obtain boundaries for each of the 77 Chicago community areas ----
boundaries <-
  GetPolygonBoundaries(my.polygon = community_areas_spdf
                       , labels = community_areas_spdf$community)
## No test: 
## sf, one polygon example ## -----

# load necessary package ----
library(sf)

# load necessary data ----
data("city_boundary_sf")

# obtain boundaries for the City of Chicago ----
boundaries <- GetPolygonBoundaries(my.polygon = city_boundary_sf)
## End(No test)

## No test: 
## sf, multipolygon example ## -----

# load necessary package ----
library(sf)

# load necessary data ----
data("community_areas_sf")

# obtain boundaries for each of the 77 Chicago community areas ----
boundaries <-
  GetPolygonBoundaries(my.polygon = community_areas_sf
                       , labels = community_areas_sf$community)
## End(No test)



