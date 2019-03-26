library(spbabel)


### Name: sptable.SpatialPolygons
### Title: Convert from various forms to a table.
### Aliases: sptable.SpatialPolygons sptable.SpatialLines
###   sptable.SpatialPointsDataFrame sptable.SpatialMultiPointsDataFrame
###   sptable<- sptable map_table.trip

### ** Examples

## holey is a decomposed SpatialPolygonsDataFrame
spdata <- sp(holey)
library(sp)
plot(spdata, col = rainbow(nrow(spdata), alpha = 0.4))
points(holey$x_, holey$y_, cex = 4)
holes <- subset(holey, !island_)
## add the points that only belong to holes
points(holes$x_, holes$y_, pch = "+", cex = 2)

## manipulate based on topology
## convert to not-holes
notahole <- holes
notahole$island_ <- TRUE
#also convert to singular objects - note that this now means we have an overlapping pair of polys
#because the door had a hole filled by another object
notahole$object_ <- notahole$branch_
plot(sp(notahole), add = TRUE, col = "red")

## example using in-place modification with sptable<-
library(maptools)
data(wrld_simpl)
spdata2 <- spdata
library(dplyr)
## modify the geometry on this object without separating the vertices from the objects
sptable(spdata2) <- sptable(spdata2) %>% dplyr::mutate(x_ = x_ + 10, y_ = y_ + 5)



