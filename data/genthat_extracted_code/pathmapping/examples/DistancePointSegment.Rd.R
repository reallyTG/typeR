library(pathmapping)


### Name: DistancePointSegment
### Title: Compute distance between a point and a segment
### Aliases: DistancePointSegment

### ** Examples


##select a random point and find its closest point
##on the segment.
x1 <- runif(1)*20
y1 <- runif(1)*20

s1x <- 5;s1y <- 5
s2x <- 0;s2y <- 15

d <- DistancePointSegment(x1,y1,s1x,s1y,s2x,s2y)
plot(c(s1x,s2x),c(s1y,s2y),pch=16,xlab="x",ylab="y",
      ylim=c(-1,20),xlim=c(-1,20),type="o")
points(x1,y1,col="red",pch=16,cex=2)

p2 <-  ClosestPoint(x1,y1,s1x,s1y,s2x,s2y)
segments(p2[1],p2[2],x1,y1,lty=3)
text(10,2,paste("Distance from line to point:",
       round(d,3)))




