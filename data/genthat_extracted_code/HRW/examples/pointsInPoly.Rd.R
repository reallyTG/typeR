library(HRW)


### Name: pointsInPoly
### Title: Points inside/outside polygon determination
### Aliases: pointsInPoly

### ** Examples

library(HRW)
myPolygon <- rbind(c(1,9),c(8,8),c(9,3),c(3,2),c(1,9))/10
plot(0:1,0:1,type = "n") ; lines(myPolygon)
xyMat <- cbind(runif(10),runif(10))
inPoly <- pointsInPoly(xyMat,myPolygon) ; print(inPoly)
points(xyMat[,1],xyMat[,2],col = as.numeric(inPoly) + 2)



