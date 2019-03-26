library(TSP)


### Name: USCA
### Title: USCA312/USCA50 - 312/50 cities in the US and Canada
### Aliases: USCA312 USCA312_map USCA312_basemap USCA312_coords USCA50
### Keywords: datasets

### ** Examples

data("USCA312")
data("USCA312_map")

## calculate a tour
tour <- solve_TSP(USCA312)
tour

## load map tools
library("maps")
library("sp")
library("maptools")

## plot map
plot(as(USCA312_coords, "Spatial"), axes=TRUE)
plot(USCA312_basemap, add=TRUE, col = "gray")


## plot tour and add cities
tour_line <- SpatialLines(list(Lines(list(
    Line(USCA312_coords[c(tour, tour[1]),])), ID="1")))

plot(tour_line, add=TRUE, col = "red")
points(USCA312_coords, pch=3, cex=0.4, col="black")



