library(SPSL)


### Name: fssa30
### Title: Frequency of Sites on a Square Anisotropic 3D lattice with
###   (1,0)-neighborhood
### Aliases: fssa30

### ** Examples

x <- y <- seq(33)
rfq <- fssa30(p=.17*c(.5,3,.5,1.5,1,.5))
image(x, y, rfq[,,17], cex.main=1,
main="Relative frequency distribution in the z=17 slice\n of anisotropic 3D clusters with (1,0)-neighborhood")
contour(x, y, rfq[,,17], levels=seq(.05,.3,.05), add=TRUE)
abline(h=17, lty=2); abline(v=17, lty=2)



