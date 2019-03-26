library(Sim.PLFN)


### Name: cuts.to.PLFN
### Title: Convert cuts to Piecewise Linear Fuzzy Number
### Aliases: cuts.to.PLFN
### Keywords: TriangularFuzzyNumber TrapezoidalFuzzyNumber FuzzyNumber
###   PowerFuzzyNumber PLFN S.PLFN cuts.to.PLFN PLFN.to.cuts Mean Var Sd CV

### ** Examples


if(!require(FuzzyNumbers)){install.packages("FuzzyNumbers")}
library(FuzzyNumbers)

knot.n = 2
T <- PLFN( knot.n=knot.n, 
	X.dist="norm", X.dist.par=c(0,1),
	slX.dist="exp", slX.dist.par=3,
	srX.dist="beta", srX.dist.par=c(1,3)
	)

T
plot(T, type="b")
CUTS <- PLFN.to.cuts(T, knot.n)
CUTS

T2 = cuts.to.PLFN(CUTS)
plot(T2, type="b", col=2, add=TRUE, lwd=3, lty=3)



