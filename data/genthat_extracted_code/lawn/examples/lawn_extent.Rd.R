library(lawn)


### Name: lawn_extent
### Title: Get a bounding box
### Aliases: lawn_extent

### ** Examples

# From a FeatureCollection
cat(lawn_data$points_average)
lawn_extent(lawn_data$points_average)

# From a Feature
dat <- '{
 "type": "Feature",
 "properties": {},
 "geometry": {
     "type": "Polygon",
     "coordinates": [[
       [-112.072391,46.586591],
       [-112.072391,46.61761],
       [-112.028102,46.61761],
       [-112.028102,46.586591],
       [-112.072391,46.586591]
     ]]
   }
}'
lawn_extent(dat)



