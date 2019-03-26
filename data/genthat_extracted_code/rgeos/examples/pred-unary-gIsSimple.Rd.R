library(rgeos)


### Name: gIsSimple
### Title: Is Geometry Simple?
### Aliases: gIsSimple RGEOSisSimple
### Keywords: spatial

### ** Examples

# MULTIPOINT examples
gIsSimple(readWKT("MULTIPOINT(1 1,2 2,3 3)"))
gIsSimple(readWKT("MULTIPOINT(1 1,2 2,1 1)"))

# LINESTRING examples
l1 = readWKT("LINESTRING(0 5,3 4,2 3,5 2)")
l2 = readWKT("LINESTRING(0 5,4 2,5 4,0 1)")
l3 = readWKT("LINESTRING(3 5,0 4,0 2,2 0,5 1,4 4,4 5,3 5)")
l4 = readWKT("LINESTRING(3 5,0 4,4 3,5 2,3 0,1 2,4 5,3 5)")

par(mfrow=c(2,2))
plot(l1);title(paste("Simple:",gIsSimple(l1)))
plot(l2);title(paste("Simple:",gIsSimple(l2)))
plot(l3);title(paste("Simple:",gIsSimple(l3)))
plot(l4);title(paste("Simple:",gIsSimple(l4)))

# MULTILINESTRING examples
ml1 = readWKT("MULTILINESTRING((0 5,1 2,5 0),(3 5,5 4,4 1))")
ml2 = readWKT("MULTILINESTRING((0 5,1 2,5 0),(0 5,5 4,4 1))")
ml3 = readWKT("MULTILINESTRING((0 5,1 2,5 0),(3 5,5 4,2 0))")

par(mfrow=c(1,3))
plot(ml1);title(paste("Simple:",gIsSimple(ml1)))
plot(ml2);title(paste("Simple:",gIsSimple(ml2)))
plot(ml3);title(paste("Simple:",gIsSimple(ml3)))	



