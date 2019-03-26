library(geozoning)


### Name: spnorm
### Title: spnorm
### Aliases: spnorm
### Keywords: internal

### ** Examples

#  shape1: result of call to readS on shapefile
z=geozoning::shape1
bb=list(x=z@bbox[1,],y=z@bbox[2,])
p=z@polygons
p1=p[[1]]
P1=p1@Polygons[[1]]
NP1=geozoning:::spnorm(P1,bb)$pn
Nbb=geozoning:::spnorm(P1,bb)$boundaryn
plot(NP1@coords,xlim=Nbb$x,ylim=Nbb$y)



