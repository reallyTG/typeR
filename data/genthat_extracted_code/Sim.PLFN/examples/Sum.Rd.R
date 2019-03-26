library(Sim.PLFN)


### Name: Sum
### Title: Summation of n Piecewise Linear Fuzzy Numbers
### Aliases: Sum
### Keywords: TriangularFuzzyNumber TrapezoidalFuzzyNumber FuzzyNumber
###   PowerFuzzyNumber PLFN S.PLFN PLFN.to.cuts Mean Var Sd CV

### ** Examples


if(!require(FuzzyNumbers)){install.packages("FuzzyNumbers")}
library(FuzzyNumbers)

n=3; knot.n=4
Sample <- S.PLFN( n, knot.n,
			X.dist="pois", X.dist.par=5,
			slX.dist="exp", slX.dist.par=3,
			srX.dist="beta", srX.dist.par=c(1,3)
			)
Sample
S = Sum(Sample)

# For plotting random fuzzy sample:
xlim = c(min(Sample[knot.n+2,1,]),S["a4"])
  plot( cuts.to.PLFN(Sample[,,1]), type="o", xlim=xlim ) 
  plot( cuts.to.PLFN(Sample[,,2]), type="o", add=TRUE ) 
  plot( cuts.to.PLFN(Sample[,,3]), type="o", add=TRUE ) 
  abline( h=round((knot.n+1):0/(knot.n+1),4), lty=3, col="gray70") 

plot( S, type="b", add=TRUE, col=2, lwd=3 )



