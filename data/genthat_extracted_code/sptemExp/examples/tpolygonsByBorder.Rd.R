library(sptemExp)


### Name: tpolygonsByBorder
### Title: tpolygonsByBorder for Generation of Thiessen polygons
### Aliases: tpolygonsByBorder

### ** Examples


data("samplepnt","prnside")
x=samplepnt
sidepoly=prnside
tpoly=tpolygonsByBorder(x,sidepoly)$tpolys
raster::plot(tpoly)




