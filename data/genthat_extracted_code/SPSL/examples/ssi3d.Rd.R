library(SPSL)


### Name: ssi3d
### Title: Site cluster on Square Isotropic 3D lattice with
###   (1,d)-neighborhood
### Aliases: ssi3d

### ** Examples

# Example No.1. Axonometric projection of 3D cluster
require(lattice)
set.seed(20120507)
x <- y <- z <- seq(33)
cls <- which(ssi3d(p0=.285)>1, arr.ind=TRUE)
cloud(cls[,3] ~ cls[,1]*cls[,2],
xlim=range(x), ylim=range(y), zlim=range(z), 
col=rgb(1,0,0,0.4), xlab="x", ylab="y", zlab="z", main.cex=1,
main="Axonometric projection of\n an isotropic 3D cluster with (1,1)-neighborhood")

# Example No.2. Z=17 slice of 3D cluster
set.seed(20120507)
cls <- ssi3d(p0=.285)
x <- y <- z <- seq(33)
image(x, y, cls[,,17], zlim=c(0,2), cex.main=1, 
main="Z=17 slice of an isotropic 3D cluster with (1,1)-neighborhood")
abline(h=17, lty=2); abline(v=17, lty=2)



