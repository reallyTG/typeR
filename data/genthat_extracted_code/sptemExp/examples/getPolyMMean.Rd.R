library(sptemExp)


### Name: getPolyMMean
### Title: Generation of Regional Monthly Mean Based on the Input Polygons
### Aliases: getPolyMMean
### Keywords: Regional mean air pollution

### ** Examples


#Use the PM2.5 concentration as an example.

data("samplepnt","prnside","shdSeries2014")
tpolys=tpolygonsByBorder(samplepnt,prnside)$tpolys
regionmmean=getPolyMMean(tpolys, samplepnt, shdSeries2014,"siteid", "rid", "obs","date")




