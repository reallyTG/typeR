library(SECP)


### Name: isc2s
### Title: Isotropic set cover on the 2D square lattice
### Aliases: isc2s

### ** Examples

# # # # # # # # # # # # # # # # #
# Example: Isotropic set cover
# # # # # # # # # # # # # # # # #
pc <- .592746
p2 <- pc + .03
lx <- 33; ss <- (lx+1)/2
set.seed(20120627); ac2 <- ssi20(x=lx, p=p2)
bnd <- isc2s(k=9, x=dim(ac2))
x <- y <- seq(lx)
image(x, y, ac2, cex.main=1,
      main=paste("Isotropic set cover and a 2D cluster of\n",
                 "sites with (1,0)-neighborhood and p=",
                 round(p2, digits=3), sep=""))
rect(bnd["x1",], bnd["y1",], bnd["x2",], bnd["y2",])
abline(h=ss, lty=2); abline(v=ss, lty=2)



