library(SPSL)


### Name: ssa3d
### Title: Site cluster on Square Anisotropic 3D lattice with
###   (1,d)-neighborhood
### Aliases: ssa3d

### ** Examples

# Example No.1. Axonometric projection of 3D cluster
require(lattice)
set.seed(20120521)
x <- y <- z <- seq(33)
cls <- which(ssa3d(p0=.09*c(1,6,1,3,2,1))>1, arr.ind=TRUE)
cloud(cls[,3] ~ cls[,1]*cls[,2],
xlim=range(x), ylim=range(y), zlim=range(z), 
col=rgb(1,0,0,0.4), xlab="x", ylab="y", zlab="z", main.cex=1,
main="Axonometric projection of\n an anisotropic 3D cluster with (1,1)-neighborhood")

# Example No.2. Z=17 slice of 3D cluster
set.seed(20120521)
x <- y <- z <- seq(33)
cls <- ssa3d(p0=.09*c(1,6,1,3,2,1))
image(x, y, cls[,,17], zlim=c(0,2), cex.main=1, 
main="Z=17 slice of an anisotropic 3D cluster with (1,1)-neighborhood")
abline(h=17, lty=2); abline(v=17, lty=2)



