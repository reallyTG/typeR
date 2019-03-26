library(geophys)


### Name: TriangleInfo
### Title: Triangle Information
### Aliases: TriangleInfo
### Keywords: misc

### ** Examples




P1 = runif(2)
P2 = runif(2)
P3 = runif(2)

  

theX = c(P1[1],P2[1], P3[1])
theY = c(P1[2],P2[2], P3[2])


        plot(theX , theY, asp=1)
        
        
        points(theX , theY)
        text(theX , theY, labels=1:3, pos=3)
        lines(c(theX, theX[1]), c(theY, theY[1]) )

TriangleInfo(P1, P2, P3, add=TRUE)
#####    TriangleInfo(rbind(P1, P2, P3),   add=TRUE)







