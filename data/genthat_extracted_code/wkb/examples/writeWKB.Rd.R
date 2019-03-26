library(wkb)


### Name: writeWKB
### Title: Convert Spatial Objects to WKB
### Aliases: writeWKB
### Keywords: wkb

### ** Examples

# load package sp
library(sp)

# create an object of class SpatialPoints
x = c(1, 2)
y = c(3, 2)
obj <- SpatialPoints(data.frame(x, y))

# convert to WKB Point
wkb <- writeWKB(obj)


# create a list of objects of class SpatialPoints
x1 = c(1, 2, 3, 4, 5)
y1 = c(3, 2, 5, 1, 4)
x2 <- c(9, 10, 11, 12, 13)
y2 <- c(-1, -2, -3, -4, -5)
Sp1 <- SpatialPoints(data.frame(x1, y1))
Sp2 <- SpatialPoints(data.frame(x2, y2))
obj <- list("a"=Sp1, "b"=Sp2)

# convert to WKB MultiPoint
wkb <- writeWKB(obj)


# create an object of class SpatialLines
l1 <- data.frame(x = c(1, 2, 3), y = c(3, 2, 2))
l1a <- data.frame(x = l1[, 1] + .05, y = l1[, 2] + .05)
l2 <- data.frame(x = c(1, 2, 3), y = c(1, 1.5, 1))
Sl1 <- Line(l1)
Sl1a <- Line(l1a)
Sl2 <- Line(l2)
S1 <- Lines(list(Sl1, Sl1a), ID = "a")
S2 <- Lines(list(Sl2), ID = "b")
obj <- SpatialLines(list(S1, S2))

# convert to WKB MultiLineString
wkb <- writeWKB(obj)


# create an object of class SpatialPolygons
triangle <- Polygons(
  list(
    Polygon(data.frame(x = c(2, 2.5, 3, 2), y = c(2, 3, 2, 2)))
  ), "triangle")
rectangles <- Polygons(
   list(
     Polygon(data.frame(x = c(0, 0, 1, 1, 0), y = c(0, 1, 1, 0, 0))),
     Polygon(data.frame(x = c(0, 0, 2, 2, 0), y = c(-2, -1, -1, -2, -2)))
   ), "rectangles")
obj <- SpatialPolygons(list(triangle, rectangles))

# convert to WKB Polygon
wkb <- writeWKB(obj)


# use the WKB as a column in a data frame
ds <- data.frame(ID = c("a","b"), Geometry = wkb)

# calculate envelope columns and cbind to the data frame
coords <- writeEnvelope(obj)
ds <- cbind(ds, coords)



