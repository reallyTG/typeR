library(adehabitatHR)


### Name: LoCoH
### Title: Estimating LoCoH home ranges
### Aliases: LoCoH LoCoH.k LoCoH.r LoCoH.a LoCoH.k.area LoCoH.r.area
###   LoCoH.a.area
### Keywords: spatial

### ** Examples

## Not run: 
##D 
##D ## Load the data
##D data(puechabonsp)
##D 
##D ## The relocations:
##D locs <- puechabonsp$relocs
##D locsdf <- as.data.frame(locs)
##D head(locsdf)
##D 
##D ## Shows the relocations
##D plot(locs, col=as.numeric(locsdf[,1]))
##D 
##D 
##D ## Examinates the changes in home-range size for various values of k
##D ## Be patient! the algorithm can be very long
##D ar <- LoCoH.k.area(locs[,1], k=c(8:13))
##D 
##D ## 12 points seems to be a good choice (rough asymptote for all animals)
##D ## the k-LoCoH method:
##D nn <- LoCoH.k(locs[,1], k=12)
##D 
##D ## Graphical display of the results
##D plot(nn, border=NA)
##D 
##D ## the object nn is a list of objects of class
##D ## SpatialPolygonsDataFrame
##D length(nn)
##D names(nn)
##D class(nn[[1]])
##D 
##D ## shows the content of the object for the first animal
##D as.data.frame(nn[[1]])
##D 
##D ## The 95% home range is the smallest area for which the
##D ## proportion of relocations included is larger or equal
##D ## to 95% In this case, it is the 22th row of the
##D ## SpatialPolygonsDataFrame.
##D ## The area covered by the home range is for this first animal
##D ## equal to 22.87 ha.
##D 
##D ## shows this area:
##D plot(nn[[1]][11,])
##D 
##D 
##D ## rasterization of the home ranges:
##D ## use the map of the area:
##D image(puechabonsp$map)
##D ras <- MCHu.rast(nn, puechabonsp$map, percent=100)  
##D opar <- par(mfrow=c(2,2))
##D lapply(1:4, function(i) { image(ras,i); box()})
##D par(opar)
##D 
##D 
##D ## r-LoCoH and a-LoCoH can be applied similarly
##D 
## End(Not run)




