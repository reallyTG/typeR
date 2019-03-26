library(waveslim)


### Name: shift.2d
### Title: Circularly Shift Matrices from a 2D MODWT
### Aliases: shift.2d
### Keywords: ts

### ** Examples

n <- 512
G1 <- G2 <- dnorm(seq(-n/4, n/4, length=n))
G <- 100 * zapsmall(outer(G1, G2))
G <- modwt.2d(G, wf="la8", J=6)
k <- 50
xr <- yr <- trunc(n/2) + (-k:k)
par(mfrow=c(3,3), mar=c(1,1,2,1), pty="s")
for (j in names(G)[1:9]) {
  image(G[[j]][xr,yr], col=rainbow(64), axes=FALSE, main=j)
}
Gs <- shift.2d(G)
for (j in names(G)[1:9]) {
  image(Gs[[j]][xr,yr], col=rainbow(64), axes=FALSE, main=j)
}



