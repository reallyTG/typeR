library(rmapshaper)


### Name: ms_points
### Title: Create points from a polygon layer
### Aliases: ms_points

### ** Examples

library(geojsonio)
library(sp)

poly <- structure("{\"type\":\"FeatureCollection\",
           \"features\":[{\"type\":\"Feature\",\"properties\":
           {\"x_pos\": 1, \"y_pos\": 2},
           \"geometry\":{\"type\":\"Polygon\",
           \"coordinates\":[[[102,2],[102,4],[104,4],[104,2],[102,2]]]}},
           {\"type\":\"Feature\",\"properties\":{\"x_pos\": 3, \"y_pos\": 4},
           \"geometry\":{\"type\":\"Polygon\",
           \"coordinates\":[[[100,2],[98,4],[101.5,4],[100,2]]]}},
           {\"type\":\"Feature\",\"properties\":{\"x_pos\": 5, \"y_pos\": 6},
           \"geometry\":{\"type\":\"Polygon\",
           \"coordinates\":[[[100,0],[100,1],[101,1],[101,0],[100,0]]]}}]}",
           class = c("json", "geo_json"))

poly <- geojson_sp(poly)
summary(poly)
plot(poly)

# Convert to points using centroids
out <- ms_points(poly, location = "centroid")
summary(out)
plot(out)

# Can also specify locations using attributes in the data
out <- ms_points(poly, x = "x_pos", y = "y_pos")
summary(out)
plot(out)




