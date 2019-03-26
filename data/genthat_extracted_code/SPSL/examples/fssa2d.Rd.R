library(SPSL)


### Name: fssa2d
### Title: Frequency of Sites on a Square Anisotropic 2D lattice with
###   (1,d)-neighborhood
### Aliases: fssa2d

### ** Examples

x <- y <- seq(33) 
image(x, y, rfq <- fssa2d(p0=c(.3,.4,.75,.5)), cex.main=1,
main="Relative frequency distribution of\n anisotropic 2D clusters with (1,1)-neighborhood")
contour(x, y, rfq, levels=seq(.2,.3,.05), add=TRUE)
abline(h=17, lty=2); abline(v=17, lty=2)



