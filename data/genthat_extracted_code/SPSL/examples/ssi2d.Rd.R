library(SPSL)


### Name: ssi2d
### Title: Site cluster on Square Isotropic 2D lattice with
###   (1,d)-neighborhood
### Aliases: ssi2d

### ** Examples

set.seed(20120507)
x <- y <- seq(33)
image(x, y, ssi2d(), zlim=c(0,2), 
main="Isotropic 2D cluster with (1,1)-neighborhood")
abline(h=17, lty=2); abline(v=17, lty=2)



