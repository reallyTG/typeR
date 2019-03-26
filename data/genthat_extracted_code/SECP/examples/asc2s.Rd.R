library(SECP)


### Name: asc2s
### Title: Anisotropic set cover on the 2D square lattice
### Aliases: asc2s

### ** Examples

# # # # # # # # # # # # # # # # #
# Example: Anisotropic set cover, dir=2
# # # # # # # # # # # # # # # # #
pc <- .592746
p2 <- pc + .03
lx <- 33; ss <- (lx+1)/2; ssy <- seq(lx+2, 2*lx-1)
set.seed(20120627); ac2 <- ssi20(x=lx, p=p2, set=ssy, all=FALSE)
bnd <- asc2s(k=9, x=dim(ac2), dir=2)
x <- y <- seq(lx)
image(x, y, ac2, cex.main=1,
      main=paste("Anisotropic set cover and a 2D cluster of\n",
                 "sites with (1,0)-neighborhood and p=",
                 round(p2, digits=3), sep=""))
rect(bnd["x1",], bnd["y1",], bnd["x2",], bnd["y2",])
abline(v=ss, lty=2)



