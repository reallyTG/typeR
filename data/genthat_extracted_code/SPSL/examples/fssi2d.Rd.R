library(SPSL)


### Name: fssi2d
### Title: Frequency of Sites on a Square Isotropic 2D lattice with
###   (1,d)-neighborhood
### Aliases: fssi2d

### ** Examples

x <- y <- seq(33)
image(x, y, rfq <- fssi2d(), cex.main=1,
main="Relative frequency distribution of\n isotropic 2D clusters with (1,1)-neighborhood")
contour(x, y, rfq, levels=seq(.2,.3,.05), add=TRUE)
abline(h=17, lty=2); abline(v=17, lty=2)



