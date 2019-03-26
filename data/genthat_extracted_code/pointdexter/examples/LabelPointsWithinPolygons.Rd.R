library(pointdexter)


### Name: LabelPointsWithinPolygons
### Title: Labels points located inside a polygon
### Aliases: LabelPointsWithinPolygons

### ** Examples

## SpatialPolygonsDataFrame, one polygon example ## -----

# load necessary data ----
data("city_boundary_spdf")
data("cps_sy1819")

# obtain boundaries for the City of Chicago ----
boundaries <-
  GetPolygonBoundaries(my.polygon = city_boundary_spdf)

# identify which schools lie within the City of Chicago -----
cps_sy1819$citywide <-
  LabelPointsWithinPolygons(lng = cps_sy1819$school_longitude
                            , lat = cps_sy1819$school_latitude
                            , polygon.boundaries = boundaries)

## SpatialPolygonsDataFrame, multipolygon polygon example ## -----

# load necessary data ----
data("community_areas_spdf")
data("cps_sy1819")

# obtain boundaries for each of the 77 Chicago community areas ----
boundaries <-
  GetPolygonBoundaries(my.polygon = community_areas_spdf
                       , labels = community_areas_spdf$community)

# identify the schools which lie within each of the 77 Chicago community areas -----
cps_sy1819$community <-
  LabelPointsWithinPolygons(lng = cps_sy1819$school_longitude
                            , lat = cps_sy1819$school_latitude
                            , polygon.boundaries = boundaries)

## No test: 
## sf, one polygon example ## -----

# load necessary package ----
library(sf)

# load necessary data ----
data("city_boundary_sf")
data("cps_sy1819")

# obtain boundaries for the City of Chicago ----
boundaries <-
  GetPolygonBoundaries(my.polygon = city_boundary_sf)

# identify which schools lie within the City of Chicago -----
cps_sy1819$citywide <-
  LabelPointsWithinPolygons(lng = cps_sy1819$school_longitude
                            , lat = cps_sy1819$school_latitude
                            , polygon.boundaries = boundaries)
                            
## End(No test)

## No test: 
## sf, multipolygon polygon example ## -----

# load necessary package ----
library(sf)

# load necessary data ----
data("community_areas_sf")
data("cps_sy1819")

# obtain boundaries for each of the 77 Chicago community areas ----
boundaries <-
  GetPolygonBoundaries(my.polygon = community_areas_sf
                       , labels = community_areas_sf$community)


# identify the schools which lie within each of the 77 Chicago community areas -----
cps_sy1819$community <-
  LabelPointsWithinPolygons(lng = cps_sy1819$school_longitude
                            , lat = cps_sy1819$school_latitude
, polygon.boundaries = boundaries)
## End(No test)



