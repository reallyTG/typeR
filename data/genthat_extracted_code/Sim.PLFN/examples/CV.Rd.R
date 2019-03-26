library(Sim.PLFN)


### Name: CV
### Title: Coefficient of variation for n PLFNs
### Aliases: CV
### Keywords: TriangularFuzzyNumber TrapezoidalFuzzyNumber FuzzyNumber
###   PowerFuzzyNumber PLFN S.PLFN cuts.to.PLFN PLFN.to.cuts Mean Var Sd

### ** Examples


library(FuzzyNumbers)
n=3; knot.n=4
Sample <- S.PLFN( n, knot.n,
			X.dist="norm", X.dist.par=c(3,2),
			slX.dist="exp", slX.dist.par=3,
			srX.dist="beta", srX.dist.par=c(1,3)
			)
Sample

# For plotting random fuzzy sample:
xlim = c(0, max(Sample[knot.n+2,2,]))
  plot( cuts.to.PLFN(Sample[,,1]), type="b", xlim=xlim ) 
  plot( cuts.to.PLFN(Sample[,,2]), type="b", add=TRUE ) 
  plot( cuts.to.PLFN(Sample[,,3]), type="b", add=TRUE ) 
  abline( h=round((knot.n+1):0/(knot.n+1),4), lty=3, col="gray70") 


FuzzyNumbers::plot(Mean(Sample), col=4, lwd=2, add=TRUE, type="b")
plot(Var(Sample), col=3, lwd=2, add=TRUE, type="b")
plot(Sd(Sample), col=6, lwd=2, add=TRUE, type="b")

CV = CV(Sample)
CV
PLFN.to.cuts(CV, knot.n)
plot(CV, col=2, lwd=2, add=TRUE, type="b")



