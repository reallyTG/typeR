library(Bessel)


### Name: Bessel
### Title: Bessel Functions of Complex Arguments I(), J(), K(), and Y()
### Aliases: BesselI BesselJ BesselK BesselY
### Keywords: math

### ** Examples


## For real small arguments, BesselI() gives the same as base::besselI() :
set.seed(47); x <- sort(round(rlnorm(20), 2))
M <- cbind(x, b = besselI(x, 3), B = BesselI(x, 3))
stopifnot(all.equal(M[,"b"], M[,"B"]))
M



