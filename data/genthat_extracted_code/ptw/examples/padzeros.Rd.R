library(ptw)


### Name: padzeros
### Title: Pad matrix with zeros
### Aliases: padzeros
### Keywords: manip

### ** Examples

data(lcms)
lcms.z1 <- padzeros(lcms[75,,1], 250, side="left")
lcms.z2 <- padzeros(lcms[75,,1], 250, side="right")
lcms.z3 <- padzeros(lcms[75,,1], 250, side="both")
zeros <- rep(0, 250)

layout(matrix(1:4,2,2, byrow=TRUE))
plot(lcms[75,,1], type="l", main="Original signal")

plot(as.vector(lcms.z1), type="l", main="Padzeros left side")
points(1:250, zeros, col=2, lwd=0.08)

plot(as.vector(lcms.z2), type="l", main="Padzeros right side")
points(2001:2250, zeros, col=2, lwd=0.08)

plot(as.vector(lcms.z3), type="l", main="Padzeros both sides")
points(1:250, zeros, col=2, lwd=0.08)
points(2251:2500, zeros, col=2, lwd=0.08)



