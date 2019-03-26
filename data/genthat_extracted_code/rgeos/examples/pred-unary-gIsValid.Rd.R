library(rgeos)


### Name: gIsValid
### Title: Is Geometry Valid?
### Aliases: gIsValid RGEOSisValid
### Keywords: spatial

### ** Examples


#LINEARRING Example
l = readWKT("LINEARRING(0 0, 100 100, 100 0, 0 100, 0 0)")
plot(l);title(paste("Valid:",gIsValid(l),"\n",gIsValid(l,reason=TRUE)))

#POLYGON and MULTIPOLYGON Examples
p1 = readWKT("POLYGON ((0 60, 0 0, 60 0, 60 60, 0 60), (20 40, 20 20, 40 20, 40 40, 20 40))")
p2 = readWKT("POLYGON ((0 60, 0 0, 60 0, 60 60, 0 60), (20 40, 20 20, 60 20, 20 40))")
p3 = readWKT(paste("POLYGON ((0 120, 0 0, 140 0, 140 120, 0 120),",
 "(100 100, 100 20, 120 20, 120 100, 100 100),",
 "(20 100, 20 40, 100 40, 20 100))"))

p4 = readWKT("POLYGON ((0 40, 0 0, 40 40, 40 0, 0 40))")
p5 = readWKT("POLYGON ((-10 50, 50 50, 50 -10, -10 -10, -10 50), (0 40, 0 0, 40 40, 40 0, 0 40))")
p6 = readWKT("POLYGON ((0 60, 0 0, 60 0, 60 20, 100 20, 60 20, 60 60, 0 60))")
p7 = readWKT(paste("POLYGON ((40 300, 40 20, 280 20, 280 300, 40 300),",
 "(120 240, 80 180, 160 220, 120 240),",
 "(220 240, 160 220, 220 160, 220 240),",
 "(160 100, 80 180, 100 80, 160 100),",
 "(160 100, 220 160, 240 100, 160 100))"))
p8 = readWKT(paste("POLYGON ((40 320, 340 320, 340 20, 40 20, 40 320),",
 "(100 120, 40 20, 180 100, 100 120),",
 "(200 200, 180 100, 240 160, 200 200),",
 "(260 260, 240 160, 300 200, 260 260),",
 "(300 300, 300 200, 340 320, 300 300))"))
p9 = readWKT(paste("MULTIPOLYGON (((20 380, 420 380, 420 20, 20 20, 20 380),",
 "(220 340, 180 240, 60 200, 200 180, 340 60, 240 220, 220 340)),",
 "((60 200, 340 60, 220 340, 60 200)))"))

par(mfrow=c(3,3))
plot(p1,col='black',pbg='white');title(paste("Valid:",gIsValid(p1),"\n",gIsValid(p1,reason=TRUE)))
plot(p2,col='black',pbg='white');title(paste("Valid:",gIsValid(p2),"\n",gIsValid(p2,reason=TRUE)))
plot(p3,col='black',pbg='white');title(paste("Valid:",gIsValid(p3),"\n",gIsValid(p3,reason=TRUE)))
plot(p4,col='black',pbg='white');title(paste("Valid:",gIsValid(p4),"\n",gIsValid(p4,reason=TRUE)))
plot(p5,col='black',pbg='white');title(paste("Valid:",gIsValid(p5),"\n",gIsValid(p5,reason=TRUE)))
plot(p6,col='black',pbg='white');title(paste("Valid:",gIsValid(p6),"\n",gIsValid(p6,reason=TRUE)))
plot(p7,col='black',pbg='white');title(paste("Valid:",gIsValid(p7),"\n",gIsValid(p7,reason=TRUE)))
plot(p8,col='black',pbg='white');title(paste("Valid:",gIsValid(p8),"\n",gIsValid(p8,reason=TRUE)))
plot(p9,col='black',pbg='white')
title(paste("Valid:",gIsValid(p9),"\n",gIsValid(p9,reason=TRUE)))	



