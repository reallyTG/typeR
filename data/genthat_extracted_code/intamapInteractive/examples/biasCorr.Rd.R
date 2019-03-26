library(intamapInteractive)


### Name: biasCorr
### Title: Bias correction
### Aliases: biasCorr
### Keywords: spatial

### ** Examples

## Not run: 
##D data(meuse)
##D data(meuse.grid)
##D observations = data.frame(x = meuse$x,y = meuse$y,value = log(meuse$zinc))
##D coordinates(observations) = ~x+y
##D gridded(meuse.grid) = ~x+y
##D pBoundaries = spsample(observations, 8, "regular",bb = bbox(observations) +  
##D               matrix(c(-400,-400,400,400),ncol=2),offset=c(0,0))
##D gridded(pBoundaries) = TRUE
##D cs = pBoundaries@grid@cellsize[1]/2
##D dx = cs/5
##D 
##D Srl = list()
##D nb = dim(coordinates(pBoundaries))[1]
##D for (i in 1:nb) {
##D   pt1 = coordinates(pBoundaries)[i,]
##D   x1 = pt1[1]-cs
##D   x2 = pt1[1]+cs
##D   y1 = pt1[2]-cs
##D   y2 = pt1[2]+cs
##D 
##D   boun = data.frame(x=c(seq(x1,x2,dx),rep(x2,11),seq(x2,x1,-dx),rep(x1,11)),
##D                     y=c(rep(y1,11),seq(y1,y2,dx),rep(y2,11),seq(y2,y1,-dx)))
##D   coordinates(boun) = ~x+y
##D   boun = Polygon(boun)
##D   Srl[[i]] = Polygons(list(boun),ID = as.character(i))
##D }
##D pBoundaries = SpatialPolygonsDataFrame(SpatialPolygons(Srl),
##D                                       data = data.frame(ID=c(1:nb)))
##D observations$ID = over(observations, geometry(pBoundaries))
##D blines = findBoundaryLines(pBoundaries,regCode = "ID")
##D 
##D 
##D object = createIntamapObject(observations,meuse.grid,boundaryLines = blines, 
##D   params = list(removeBias = "regionalBias"))
##D object = biasCorr(object,regCode= "ID")
##D object$regionalBias$regionalBias
##D pBoundaries$bias = NA
##D pBoundaries$bias[object$regionalBias$regionalBias$ID] = object$regionalBias$regionalBias$ols
##D spplot(pBoundaries,"bias",sp.layout = list(list("sp.points",observations)))
## End(Not run)



