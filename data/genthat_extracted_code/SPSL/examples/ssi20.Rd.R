library(SPSL)


### Name: ssi20
### Title: Site cluster on Square Isotropic 2D lattice with
###   (1,0)-neighborhood
### Aliases: ssi20

### ** Examples

set.seed(20120507)
x <- y <- seq(33)
image(x, y, ssi20(), zlim=c(0,2), 
main="Isotropic 2D cluster with (1,0)-neighborhood")
abline(h=17, lty=2); abline(v=17, lty=2)



