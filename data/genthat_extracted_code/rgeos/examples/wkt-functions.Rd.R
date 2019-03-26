library(rgeos)


### Name: RGEOS WKT Functions
### Title: RGEOS WKT Functions
### Aliases: readWKT writeWKT
### Keywords: spatial

### ** Examples

g1=readWKT("POINT(6 10)")
g2=readWKT("LINESTRING(3 4,10 50,20 25)")
g3=readWKT("POLYGON((1 1,5 1,5 5,1 5,1 1),(2 2,2 3,3 3,3 2,2 2))")
g4=readWKT("MULTIPOINT((3.5 5.6),(4.8 10.5))")
g5=readWKT("MULTILINESTRING((3 4,10 50,20 25),(-5 -8,-10 -8,-15 -4))")
g6=readWKT("MULTIPOLYGON(((1 1,5 1,5 5,1 5,1 1),(2 2,2 3,3 3,3 2,2 2)),((6 3,9 2,9 4,6 3)))")
try(readWKT("POINT EMPTY"))
try(readWKT("MULTIPOLYGON EMPTY"))
g9=readWKT("GEOMETRYCOLLECTION(POINT(4 6),LINESTRING(4 6,7 10))")

writeWKT(g1)
writeWKT(g2)
writeWKT(g3)
writeWKT(g4)
writeWKT(g5)
writeWKT(g6)
writeWKT(g9,byid=FALSE)
writeWKT(g9,byid=TRUE)



