library(SPSL)


### Name: fssi20
### Title: Frequency of Sites on a Square Isotropic 2D lattice with
###   (1,0)-neighborhood
### Aliases: fssi20

### ** Examples

x <- y <- seq(33) 
image(x, y, rfq <- fssi20(), cex.main=1,
main="Relative frequency distribution of\n isotropic 2D clusters with (1,0)-neighborhood")
contour(x, y, rfq, levels=seq(.2,.3,.05), add=TRUE)
abline(h=17, lty=2); abline(v=17, lty=2)



