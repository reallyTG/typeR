library(SPSL)


### Name: fssa20
### Title: Frequency of Sites on a Square Anisotropic 2D lattice with
###   (1,0)-neighborhood
### Aliases: fssa20

### ** Examples

x <- y <- seq(33)
image(x, y, rfq <- fssa20(p=c(.3,.4,.75,.5)), cex.main=1,
main="Relative frequency distribution of\n anisotropic 2D clusters with (1,0)-neighborhood")
contour(x, y, rfq, levels=seq(.2,.3,.05), add=TRUE)
abline(h=17, lty=2); abline(v=17, lty=2)



