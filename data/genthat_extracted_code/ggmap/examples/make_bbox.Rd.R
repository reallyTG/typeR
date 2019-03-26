library(ggmap)


### Name: make_bbox
### Title: Compute a bounding box
### Aliases: make_bbox

### ** Examples


make_bbox(lon, lat, data = crime)

(lon <- sample(crime$lon, 10))
(lat <- sample(crime$lat, 10))
make_bbox(lon, lat)
make_bbox(lon, lat, f = .10) # bigger box





