## ----load necessary packages, message = FALSE----------------------------
# load necessary packages -----
library(pointdexter) # label coordinate pairs in polygons
library(sp)          # classes and methods for spatial data
library(knitr)       # simple table generator

## ----load point data, fig.show = 'hold'----------------------------------
# load necessary data ----
data("cps_sy1819")

# store relevant columns ----
relevant.columns <-
  c("school_id", "short_name"
    , "school_longitude", "school_latitude")

# print first few rows of data ----
kable(head(cps_sy1819[, relevant.columns])
      , caption = "Table 1. Examining CPS SY1819 school profile data")

## ----load polygon data, message = FALSE, fig.show = 'hold'---------------
# load city boundary data ----
data("city_boundary_spdf")

# load community area data ----
data("community_areas_spdf")

# visualize polygons -----
# note: clear plot space
par(mar = c(0, 0, 1, 0))

# plot city boundary
plot(city_boundary_spdf
     , main = "City of Chicago boundary"
     , col = "gray85"
     , border = "dodgerblue4")

# plot community areas
plot(community_areas_spdf
     , main = "Chicago's 77 community areas"
     , col = "gray85"
     , border = "dodgerblue4")

## ----use GetPolygonBoundaries() with one polygon-------------------------
# create coordinate pair matrix for city of chicago boundary ----
boundary <- 
  GetPolygonBoundaries(my.polygon = city_boundary_spdf)

# print first few records ----
kable(head(boundary)
        , caption = "Table 2. boundary is a matrix of coordinate pairs"
        , col.names = c("long", "lat"))

## ----use GetPolygonBoundaries() with multiple polygons-------------------
# create list of coordinate pair matrices for each community area ----
community.area.boundaries <-
  GetPolygonBoundaries(my.polygon = community_areas_spdf
                       , labels = community_areas_spdf$community)

# print first few records for two communities ----
kable(lapply(community.area.boundaries[c("AUSTIN", "WEST ELSDON")]
             , FUN = head)
      , caption = "Table 3. Austin (left) and West Elsdon's (right) boundaries"
      , col.names = c("long", "lat"))

## ----polygon.boundaries is a matrix--------------------------------------
# identify cps schools that lie in Chicago ----
cps_sy1819$in_chicago <-
  LabelPointsWithinPolygons(lng = cps_sy1819$school_longitude
                            , lat = cps_sy1819$school_latitude
                            , polygon.boundaries = boundary)

# show first few records ----
kable(head(cps_sy1819[, c(relevant.columns, "in_chicago")])
      , caption = "Table 4. A logical vector is returned when polygon.boundaries is a matrix")

## ----polygon.boundaries is a list----------------------------------------
# identify the community that each cps school lies in ----
cps_sy1819$community <-
  LabelPointsWithinPolygons(lng = cps_sy1819$school_longitude
                            , lat = cps_sy1819$school_latitude
                            , polygon.boundaries = community.area.boundaries)

# show first few records ----
kable(head(cps_sy1819[, c(relevant.columns, "in_chicago", "community")])
           , caption = "Table 5. A character vector is returned when polygon.boundaries is a list of labeled matrices")

## ----conclusion----------------------------------------------------------
# identify the school ratings for high schools in Austin ---- 

# filter cps schools
austin.hs <-
  cps_sy1819[cps_sy1819$community == "AUSTIN" & cps_sy1819$is_high_school, ]

# arrange data by overall rating
austin.hs <- austin.hs[order(austin.hs$overall_rating), ]

# show results
kable(austin.hs[, c(relevant.columns , "overall_rating",
              "is_high_school", "community")]
      , caption = "Table 6. Austin's highest rank high school is YCCS - Scholastic Academy, SY1819"
        , row.names = FALSE)

## ----session info--------------------------------------------------------
sessionInfo()

