library(SPSL)


### Name: fssi30
### Title: Frequency of Sites on a Square Isotropic 3D lattice with
###   (1,0)-neighborhood
### Aliases: fssi30

### ** Examples

x <- y <- seq(33)
rfq <- fssi30(p=0.37)
image(x, y, rfq[,,17], cex.main=1, 
main="Relative frequency distribution in the z=17 slice\n of isotropic 3D clusters with (1,0)-neighborhood")
contour(x, y, rfq[,,17], levels=c(0.2,0.25,0.3), add=TRUE)
abline(h=17, lty=2); abline(v=17, lty=2)



