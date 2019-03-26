library(Sim.PLFN)


### Name: Var
### Title: Variance of n Piecewise Linear Fuzzy Numbers
### Aliases: Var
### Keywords: TriangularFuzzyNumber TrapezoidalFuzzyNumber FuzzyNumber
###   PowerFuzzyNumber PLFN S.PLFN PLFN.to.cuts Mean Sd CV Sum

### ** Examples


if(!require(FuzzyNumbers)){install.packages("FuzzyNumbers")}
library(FuzzyNumbers)

n=3; knot.n=4
Sample <- S.PLFN( n, knot.n,
			X.dist="norm", X.dist.par=c(3,2),
			slX.dist="exp", slX.dist.par=3,
			srX.dist="beta", srX.dist.par=c(1,3)
			)
Sample

# For plotting random fuzzy sample:
xlim = c( min(Sample), max(Sample) )
  plot( cuts.to.PLFN(Sample[,,1]), type="o", xlim=xlim ) 
  plot( cuts.to.PLFN(Sample[,,2]), type="o", add=TRUE ) 
  plot( cuts.to.PLFN(Sample[,,3]), type="o", add=TRUE ) 
  abline( h=round((knot.n+1):0/(knot.n+1),4), lty=3, col="gray70") 


plot(Mean(Sample), col=4, lwd=2, add=TRUE, type="b", pch=2)
S2 = Var(Sample)
S2
PLFN.to.cuts(S2, knot.n)
plot(S2, col=2, lwd=2, add=TRUE, type="b", pch=3)



