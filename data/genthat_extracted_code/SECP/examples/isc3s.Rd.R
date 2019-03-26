library(SECP)


### Name: isc3s
### Title: Isotropic set cover on the 3D square lattice
### Aliases: isc3s

### ** Examples

# # # # # # # # # # # # # # # # #
# Example: Isotropic set cover
# # # # # # # # # # # # # # # # #
pc <- .311608
p2 <- pc + .03
lx <- 33; ss <- (lx+1)/2
set.seed(20120627); ac2 <- ssi30(x=lx, p=p2)
bnd <- isc3s(k=9, x=dim(ac2))
x <- z <- seq(lx); y2 <- ac2[,ss,]
image(x, z, y2, cex.main=1,
      main=paste("Isotropic set cover and\n",
                 "a 3D cluster of sites in the y=",ss," slice with\n",
                 "(1,0)-neighborhood and p=",
                 round(p2, digits=3), sep=""))
rect(bnd["x1",], bnd["z1",], bnd["x2",], bnd["z2",])
abline(h=ss, lty=2); abline(v=ss, lty=2)



