library(bivrp)


### Name: polygon-operations
### Title: Polygon operations
### Aliases: polygon.area get.k get.newpolygon
### Keywords: polygon

### ** Examples

  oldPolygon <- data.frame(x=c(2,1,3,4.5,5), y=c(1,3,5,4.5,2))
  
  # area
  polygon.area(oldPolygon)$area
  # centre of mass
  polygon.area(oldPolygon)$centre
  
  # get a new polygon with 50% of the area of the old one
  newPolygon <- get.newpolygon(conf=.5, P=oldPolygon, method="proportional")
  polygon.area(newPolygon)$area/polygon.area(oldPolygon)$area
  
  # second method
  newPolygon2 <- get.newpolygon(conf=.5, P=oldPolygon, method="get.k")
  polygon.area(newPolygon2)$area/polygon.area(oldPolygon)$area
  
  # illustration
  plot(oldPolygon, xlim=c(0,6), ylim=c(0,6), main="(a)", pch=16)
  polygon(oldPolygon, lwd=2, col="#00000033")
  text(oldPolygon, c(expression(P[1]), expression(P[2]),
                     expression(P[3]), expression(P[4]),
                     expression(P[5])), pos=c(1,2,3,4,4), cex=2)
  polygon(newPolygon, border=4, lwd=2, col="#52A3E199")
  points(newPolygon, pch=16, col=4)
  text(newPolygon, c(expression(paste(P[1],minute)), expression(paste(P[2],minute)),
             expression(paste(P[3],minute)), expression(paste(P[4],minute)),
             expression(paste(P[5],minute))), pos=c(1,3,2,4,4), col=4, cex=2)

  C <- polygon.area(oldPolygon)$centre
  text(C[1], C[2], "C", pos=4, cex=2)
  for(i in 1:5) lines(c(C[1], oldPolygon[i,1]), 
                      c(C[2], oldPolygon[i,2]), lty=2, lwd=2, type="b")



