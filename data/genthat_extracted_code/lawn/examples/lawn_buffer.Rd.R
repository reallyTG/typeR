library(lawn)


### Name: lawn_buffer
### Title: Buffer a feature
### Aliases: lawn_buffer

### ** Examples

# From a Point
pt <- '{
 "type": "Feature",
 "properties": {},
 "geometry": {
    "type": "Point",
    "coordinates": [-90.548630, 14.616599]
  }
}'
lawn_buffer(pt, 5)

# From a FeatureCollection
dat <- lawn_random(n = 100)
lawn_buffer(dat, 100)

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
lawn_buffer(dat, 1, "miles")

# buffer a point
lawn_buffer(lawn_point(c(-74.50,40)), 100, "meters")




