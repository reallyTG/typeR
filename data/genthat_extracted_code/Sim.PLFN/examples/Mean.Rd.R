library(Sim.PLFN)


### Name: Mean
### Title: Mean of n Piecewise Linear Fuzzy Numbers
### Aliases: Mean
### Keywords: TriangularFuzzyNumber TrapezoidalFuzzyNumber FuzzyNumber
###   PowerFuzzyNumber PLFN S.PLFN PLFN.to.cuts Mean Sum Var Sd CV

### ** Examples

library(FuzzyNumbers)

n=3; knot.n=4
Sample <- S.PLFN( n, knot.n,
			X.dist="pois", X.dist.par=5,
			slX.dist="exp", slX.dist.par=3,
			srX.dist="beta", srX.dist.par=c(1,3)
			)
Sample

# For plotting random fuzzy sample:
xlim = c( min(Sample), max(Sample) )
  plot( cuts.to.PLFN(Sample[,,1]), type="b", xlim=xlim ) 
  plot( cuts.to.PLFN(Sample[,,2]), type="b", add=TRUE ) 
  plot( cuts.to.PLFN(Sample[,,3]), type="b", add=TRUE ) 
  abline( h=round((knot.n+1):0/(knot.n+1),4), lty=3, col="gray70") 

M = Mean(Sample)
M
plot( M, type="b", add=TRUE, col=2, lwd=3 )



