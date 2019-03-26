library(geoR)


### Name: coords.aniso
### Title: Geometric Anisotropy Correction
### Aliases: coords.aniso
### Keywords: spatial

### ** Examples

op <- par(no.readonly = TRUE)
par(mfrow=c(3,2))
par(mar=c(2.5,0,0,0))
par(mgp=c(2,.5,0))
par(pty="s")
## Defining a set of coordinates
coords <- expand.grid(seq(-1, 1, l=3), seq(-1, 1, l=5))
plot(c(-1.5, 1.5), c(-1.5, 1.5), xlab="", ylab="", type="n")
text(coords[,1], coords[,2], 1:nrow(coords))
## Transforming coordinates according to some anisotropy parameters
coordsA <- coords.aniso(coords, aniso.pars=c(0, 2))
plot(c(-1.5, 1.5), c(-1.5, 1.5), xlab="", ylab="", type="n")
text(coordsA[,1], coordsA[,2], 1:nrow(coords))
##
coordsB <- coords.aniso(coords, aniso.pars=c(pi/2, 2))
plot(c(-1.5, 1.5), c(-1.5, 1.5), xlab="", ylab="", type="n")
text(coordsB[,1], coordsB[,2], 1:nrow(coords))
##
coordsC <- coords.aniso(coords, aniso.pars=c(pi/4, 2))
plot(c(-1.5, 1.5), c(-1.5, 1.5), xlab="", ylab="", type="n")
text(coordsC[,1], coordsC[,2], 1:nrow(coords))
##
coordsD <- coords.aniso(coords, aniso.pars=c(3*pi/4, 2))
plot(c(-1.5, 1.5), c(-1.5, 1.5), xlab="", ylab="", type="n")
text(coordsD[,1], coordsD[,2], 1:nrow(coords))
##
coordsE <- coords.aniso(coords, aniso.pars=c(0, 5))
plot(c(-1.5, 1.5), c(-1.5, 1.5), xlab="", ylab="", type="n")
text(coordsE[,1], coordsE[,2], 1:nrow(coords))
##
par(op)



