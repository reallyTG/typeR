library(matlib)


### Name: arc
### Title: Draw an arc showing the angle between vectors
### Aliases: arc

### ** Examples

library(rgl)
vec <- rbind(diag(3), c(1,1,1))
rownames(vec) <- c("X", "Y", "Z", "J")
open3d()
aspect3d("iso")
vectors3d(vec, col=c(rep("black",3), "red"), lwd=2)
# draw the XZ plane, whose equation is Y=0
planes3d(0, 0, 1, 0, col="gray", alpha=0.2)
# show projections of the unit vector J
segments3d(rbind( c(1,1,1), c(1, 1, 0)))
segments3d(rbind( c(0,0,0), c(1, 1, 0)))
segments3d(rbind( c(1,0,0), c(1, 1, 0)))
segments3d(rbind( c(0,1,0), c(1, 1, 0)))
segments3d(rbind( c(1,1,1), c(1, 0, 0)))

# show some orthogonal vectors
p1 <- c(0,0,0)
p2 <- c(1,1,0)
p3 <- c(1,1,1)
p4 <- c(1,0,0)
# show some angles
arc(p1, p2, p3, d=.2)
arc(p4, p1, p2, d=.2)
arc(p3, p1, p2, d=.2)



