library(SPSL)


### Name: ssa2d
### Title: Site cluster on Square Anisotropic 2D lattice with
###   (1,d)-neighborhood
### Aliases: ssa2d

### ** Examples

set.seed(20120507)
x <- y <- seq(33)
image(x, y, ssa2d(), zlim=c(0,2), 
main="Anisotropic 2D cluster with (1,1)-neighborhood")
abline(h=17, lty=2); abline(v=17, lty=2)



