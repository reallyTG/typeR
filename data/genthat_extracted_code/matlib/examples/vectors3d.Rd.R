library(matlib)


### Name: vectors3d
### Title: Draw 3D vectors
### Aliases: vectors3d

### ** Examples

vec <- rbind(diag(3), c(1,1,1))
rownames(vec) <- c("X", "Y", "Z", "J")
library(rgl)
open3d()
vectors3d(vec, color=c(rep("black",3), "red"), lwd=2)
# draw the XZ plane, whose equation is Y=0
planes3d(0, 0, 1, 0, col="gray", alpha=0.2)
vectors3d(c(1,1,0), col="green", lwd=2)
# show projections of the unit vector J
segments3d(rbind(c(1,1,1), c(1, 1, 0)))
segments3d(rbind(c(0,0,0), c(1, 1, 0)))
segments3d(rbind(c(1,0,0), c(1, 1, 0)))
segments3d(rbind(c(0,1,0), c(1, 1, 0)))
# show some orthogonal vectors
p1 <- c(0,0,0)
p2 <- c(1,1,0)
p3 <- c(1,1,1)
p4 <- c(1,0,0)
corner(p1, p2, p3, col="red")
corner(p1, p4, p2, col="red")
corner(p1, p4, p3, col="blue")

rgl.bringtotop()



