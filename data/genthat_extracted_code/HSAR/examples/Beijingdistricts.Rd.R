library(HSAR)


### Name: Beijingdistricts
### Title: Boundaries of districts (SpatialPolygonsDataFrame) in Beijing
### Aliases: Beijingdistricts
### Keywords: hierarchical spatial data

### ** Examples

data(Beijingdistricts)

library(spdep)
plot(Beijingdistricts,border="light grey")
# extract the area of each district
library(rgeos)
library(classInt)
library(RColorBrewer)

Beijingdistricts$geo.area <- gArea(Beijingdistricts,byid=TRUE) / 1000000
x <- Beijingdistricts$geo.area
breaks <- classIntervals(x,4,"fisher")$brks
groups <- cut(x,breaks,include.lowest=TRUE,labels=FALSE)
palette <- brewer.pal(4, "Blues")
plot(Beijingdistricts,col=palette[groups],border="grey")

# extract the district level spatial weights matrix
nb.list <- poly2nb(Beijingdistricts,queen=FALSE)
mat.list <- nb2mat(nb.list,style="W")
M <- as(mat.list,"dgCMatrix")



