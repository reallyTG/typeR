library(compositions)


### Name: missingProjector
### Title: Returns a projector the the observed space in case of missings.
### Aliases: missingProjector missingProjector.acomp missingProjector.rcomp
###   missingProjector.aplus missingProjector.rplus missingProjector.rmult
### Keywords: NA

### ** Examples

data(SimulatedAmounts)
x <- acomp(sa.lognormals)
xnew <- simulateMissings(x,dl=0.05,MAR=0.05,MNAR=0.05,SZ=0.05)
xnew
plot(missingSummary(xnew))

missingProjector(acomp(xnew))
missingProjector(rcomp(xnew))
missingProjector(aplus(xnew))
missingProjector(rplus(xnew))




