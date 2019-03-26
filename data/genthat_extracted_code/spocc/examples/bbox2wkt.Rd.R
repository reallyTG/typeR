library(spocc)


### Name: bbox2wkt
### Title: Convert a bounding box to a Well Known Text polygon, and a WKT
###   to a bounding box
### Aliases: bbox2wkt wkt2bbox

### ** Examples

# Convert a bounding box to a WKT

## Pass in a vector of length 4 with all values
bbox2wkt(bbox = c(-125.0,38.4,-121.8,40.9))

## Or pass in each value separately
bbox2wkt(-125.0, 38.4, -121.8, 40.9)

# Convert a WKT object to a bounding box
wkt <- "POLYGON((-125 38.4,-125 40.9,-121.8 40.9,-121.8 38.4,-125 38.4))"
wkt2bbox(wkt)

identical(
 bbox2wkt(-125.0, 38.4, -121.8, 40.9),
 "POLYGON((-125 38.4,-121.8 38.4,-121.8 40.9,-125 40.9,-125 38.4))"
)

identical(
 c(-125.0, 38.4, -121.8, 40.9),
 as.numeric(
   wkt2bbox(
     "POLYGON((-125 38.4,-125 40.9,-121.8 40.9,-121.8 38.4,-125 38.4))"
   )
 )
)



