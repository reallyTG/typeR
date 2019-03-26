library(SPSL)


### Name: ssa20
### Title: Site cluster on Square Anisotropic 2D lattice with
###   (1,0)-neighborhood
### Aliases: ssa20

### ** Examples

set.seed(20120507)
x <- y <- seq(33)
image(x, y, ssa20(), zlim=c(0,2), 
main="Anisotropic 2D cluster with (1,0)-neighborhood")
abline(h=17, lty=2); abline(v=17, lty=2)



