library(gamlss.spatial)


### Name: draw.polys
### Title: Additional supporting functions for random Markov fields
### Aliases: draw.polys polys2nb nb2prec polys2polys nb2nb
### Keywords: regression spatial

### ** Examples

# bringing the required libraries
library(spdep)
library(maptools)
# reading the shape file from package spdep
bh <- readShapePoly(system.file("etc/shapes/bhicv.shp",
             package="spdep")[1])
# pick up parts of the data and scale them
  BhData <- data.frame(scale(bh@data[,5:8]))  
# getting the neighbourhood and the polygons using the package 
# spdep functions 
   bh.nb <- poly2nb(bh) # neighbourhood
bh.polys <- bh@polygons # polygons
# now getting the information for the S4 object to required format
# from object S4 to object S3
newpolys <- polys2polys(bh.polys,bh.nb)
  newnb  <- nb2nb(bh.nb)
# drawing the map 
draw.polys(newpolys[[1]])
# plotting one of the variables in BhData
 poo <-BhData$HLCI
names(poo) <- row.names(BhData)
 draw.polys(newpolys[[1]], poo)
# now get the precision matrix
Prec <- nb2prec(newnb, x=as.factor(row.names(BhData)), 
          area=as.factor(row.names(BhData)))



