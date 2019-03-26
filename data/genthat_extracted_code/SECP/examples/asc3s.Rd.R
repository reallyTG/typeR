library(SECP)


### Name: asc3s
### Title: Anisotropic set cover on the 3D square lattice
### Aliases: asc3s

### ** Examples

# # # # # # # # # # # # # # # # #
# Example: Anisotropic set cover, dir=3
# # # # # # # # # # # # # # # # #
pc <- .311608
p2 <- pc + .03
lx <- 33; ss <- (lx+1)/2; ssz <- seq(lx^2+lx+2, 2*lx^2-lx-1)
set.seed(20120627); ac2 <- ssi30(x=lx, p=p2, set=ssz, all=FALSE)
bnd <- asc3s(k=9, x=dim(ac2), dir=3)
x <- z <- seq(lx); y2 <- ac2[,ss,]
image(x, z, y2, cex.main=1,
      main=paste("Anisotropic set cover and\n",
                 "a 3D cluster of sites in the y=",ss," slice with\n",
                 "(1,0)-neighborhood and p=", 
                 round(p2, digits=3), sep=""))
rect(bnd["x1",], bnd["z1",], bnd["x2",], bnd["z2",])
abline(v=ss, lty=2)



