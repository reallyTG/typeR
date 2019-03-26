library(sptemExp)


### Name: getRidbytpoly
### Title: getRidbytpoly for Assignment of Thiessen polygon id to point
###   object
### Aliases: getRidbytpoly

### ** Examples


  data("samplepnt","prnside")
  # Point
  x=samplepnt
  # Border
  sidepoly=prnside
  # Get the Thiessen polygons
  res=tpolygonsByBorder(x,sidepoly)
  # Assign the regional id
  rids=getRidbytpoly(res$tpolys,x)




