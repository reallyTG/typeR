## ---- eval=FALSE---------------------------------------------------------
#  wkt <- c("POLYGON ((30 10, 40 40, 20 40, 10 20, 30 10))",
#           "LINESTRING (30 10, 10 90, 40 40)")
#  wkt_bounding(wkt)
#  #   min_x min_y max_x max_y
#  # 1    10    10    40    40
#  # 2    10    10    40    90

## ---- eval=FALSE---------------------------------------------------------
#  bounding_wkt(min_x = 10, min_y = 10, max_x = 40, max_y = 40)
#  # [1] "POLYGON((10 10,10 40,40 40,40 10,10 10))"

## ---- eval=FALSE---------------------------------------------------------
#  wkt <- c("POLYGON ((30 10, 40 40, 20 40, 10 20, 30 10))",
#           "ARGHLEFLARFDFG",
#           "LINESTRING (30 10, 10 90, 40 out of cheese error redo universe from start)")
#  validate_wkt(wkt)
#  #   is_valid comments
#  # 1    FALSE The WKT object has a different orientation from the default
#  # 2    FALSE Object could not be recognised as a supported WKT type
#  # 3    FALSE bad lexical cast: source type value could not be interpreted as target at 'out' in 'linestring (30 10, 10 90, 40 out of cheese error redo universe from start)'

## ---- eval=FALSE---------------------------------------------------------
#  library(sp)
#  Sr1 <- Polygon(cbind(c(2,4,4,1,2),c(2,3,5,4,2)))
#  Sr2 <- Polygon(cbind(c(5,4,2,5),c(2,3,2,2)))
#  Sr3 <- Polygon(cbind(c(4,4,5,10,4),c(5,3,2,5,5)))
#  Sr4 <- Polygon(cbind(c(5,6,6,5,5),c(4,4,3,3,4)), hole = TRUE)
#  
#  Srs1 <- Polygons(list(Sr1), "s1")
#  Srs2 <- Polygons(list(Sr2), "s2")
#  Srs3 <- Polygons(list(Sr3, Sr4), "s3/4")
#  sp_object <- SpatialPolygons(list(Srs1,Srs2,Srs3), 1:3)
#  
#  # With grouping
#  sp_convert(x = sp_object, group = TRUE)
#  # [1] "MULTIPOLYGON(((2 2,1 4,4 5,4 3,2 2)),((5 2,2 2,4 3,5 2)),((4 5,10 5,5 2,4 3,4 5)),((5 4,5 3,6 3,6 4,5 4)))"
#  
#  # Without grouping
#  sp_convert(x = sp_object, group = FALSE)
#  # [[1]]
#  # [1] "POLYGON((2 2,1 4,4 5,4 3,2 2))"  "POLYGON((5 2,2 2,4 3,5 2))"      "POLYGON((4 5,10 5,5 2,4 3,4 5))"
#  # [4] "POLYGON((5 4,5 3,6 3,6 4,5 4))"
#  

## ---- eval=FALSE---------------------------------------------------------
#  wkt_coords(("POLYGON ((30 10, 40 40, 20 40, 10 20, 30 10))"))
#  #   object  ring lng lat
#  # 1      1 outer  30  10
#  # 2      1 outer  40  40
#  # 3      1 outer  20  40
#  # 4      1 outer  10  20
#  # 5      1 outer  30  10

## ---- eval=FALSE---------------------------------------------------------
#  wkt_centroid(("POLYGON ((30 10, 40 40, 20 40, 10 20, 30 10))"))
#  #        lng     lat
#  # 1 25.45455 26.9697

