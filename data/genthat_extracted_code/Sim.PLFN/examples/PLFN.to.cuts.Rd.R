library(Sim.PLFN)


### Name: PLFN.to.cuts
### Title: Convert Piecewise Linear Fuzzy Number to a cuts matrix
### Aliases: PLFN.to.cuts
### Keywords: TriangularFuzzyNumber TrapezoidalFuzzyNumber FuzzyNumber
###   PowerFuzzyNumber PLFN S.PLFN Mean Var Sd CV

### ** Examples


knot.n = 2
T <- PLFN( knot.n=knot.n,
	X.dist="norm", X.dist.par=c(0,1),
	slX.dist="exp", slX.dist.par=3,
	srX.dist="beta", srX.dist.par=c(1,3)
	)

T
FuzzyNumbers::plot(T, type="b")
cuts = PLFN.to.cuts(T, knot.n)
cuts
cuts[,"L"]  #Lower bounds of cuts
cuts[,"U"]  #Upper bounds of cuts
cuts[2,]    #Or equivalently  cuts["0.6667",]



