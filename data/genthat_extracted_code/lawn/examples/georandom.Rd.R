library(lawn)


### Name: georandom
### Title: Return a FeatureCollection with N number of features with random
###   coordinates
### Aliases: georandom gr_point gr_position gr_polygon

### ** Examples

# Random points
gr_point(5)
gr_point(10)
gr_point(1000)
## with bounding box
gr_point(5, c(50, 50, 60, 60))

# Random positions
gr_position()
## with bounding box
gr_position(c(0, 0, 10, 10))

# Random polygons
## number of polygons, default is 1 polygon
gr_polygon()
gr_polygon(5)
## number of vertices, 3 vs. 100
gr_polygon(1, 3)
gr_polygon(1, 100)
## max radial length, compare the following three
gr_polygon(1, 10, 5)
gr_polygon(1, 10, 30)
gr_polygon(1, 10, 100)
## use a bounding box
gr_polygon(1, 5, 5, c(50, 50, 60, 60))



