library(sptemExp)


### Name: voronoipolygons2
### Title: Generation of Thiesseon Polygons By Points
### Aliases: voronoipolygons2
### Keywords: ~kwd1 ~kwd2

### ** Examples


data("samplepnt","prnside")
x=samplepnt
sidepoly=prnside
prjinf=sp::proj4string(x)
sidepoly_p=sp::spTransform(sidepoly,prjinf)
extBnd=as(raster::extent(sidepoly_p), 'SpatialPolygons')
sp::proj4string(extBnd)=prjinf
pzn.coords=voronoipolygons2(x,extBnd)
sp::proj4string(pzn.coords)=prjinf





