library(rgeos)


### Name: gPolygonize
### Title: Linestring Polygonizer
### Aliases: gPolygonize
### Keywords: spatial

### ** Examples

library(sp)
linelist = list(readWKT("LINESTRING (0 0 , 10 10)"),
				readWKT("LINESTRING (185 221, 100 100)"),
				readWKT("LINESTRING (185 221, 88 275, 180 316)"),
				readWKT("LINESTRING (185 221, 292 281, 180 316)"), 
				readWKT("LINESTRING (189 98, 83 187, 185 221)"), 
				readWKT("LINESTRING (189 98, 325 168, 185 221)"))

par(mfrow=c(1,2))
plot(linelist[[1]],xlim=c(0,350),ylim=c(0,350))
title("Linestrings with nodes")
plot(as(linelist[[1]],"SpatialPoints"),pch=16,add=TRUE)

for(i in 2:length(linelist)) {
	plot(linelist[[i]],add=TRUE)
	plot(as(linelist[[i]],"SpatialPoints"),pch=16,add=TRUE)
}

plot(gPolygonize(linelist),xlim=c(0,350),ylim=c(0,350))
title("Polygonized Results")

gPolygonize(linelist,getCutEdges=TRUE) # no cut edges



linelist2 = list(readWKT("LINESTRING(1 3, 3 3, 3 1, 1 1, 1 3)"),
				 readWKT("LINESTRING(1 3, 3 3, 3 1, 1 1, 1 3)"))

gPolygonize(linelist2,getCutEdges=FALSE) # NULL
gPolygonize(linelist2,getCutEdges=TRUE) # Contains LineStrings
# bug fix 130206
LS = list(
readWKT("LINESTRING (425963 576719, 425980 576703)"),
readWKT("LINESTRING (425963 576719, 425882 577073)"),
readWKT("LINESTRING (425980 576703, 426082 577072)"),
readWKT("LINESTRING (425882 577073, 426082 577072)"),
readWKT("LINESTRING (426138 577068, 426082 577072)"),
readWKT("LINESTRING (426138 577068, 426420 577039)"),
readWKT("LINESTRING (426420 577039, 426554 576990)"),
readWKT("LINESTRING (426751 576924, 426776 576823)"),
readWKT("LINESTRING (426751 576924, 426783 576919)"),
readWKT("LINESTRING (426751 576924, 426714 576953)"),
readWKT("LINESTRING (426776 576823, 426783 576919)"),
readWKT("LINESTRING (426658 576966, 426554 576990)"),
readWKT("LINESTRING (426658 576966, 426667 577031)"),
readWKT("LINESTRING (426658 576966, 426714 576953)"),
readWKT("LINESTRING (426667 577031, 426714 576953)")
)
plot(gPolygonize(LS))



