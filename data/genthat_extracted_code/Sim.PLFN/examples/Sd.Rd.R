library(Sim.PLFN)


### Name: Sd
### Title: Standard of Deviation of n Piecewise Linear Fuzzy Numbers
### Aliases: Sd
### Keywords: TriangularFuzzyNumber TrapezoidalFuzzyNumber FuzzyNumber
###   PowerFuzzyNumber PLFN S.PLFN PLFN.to.cuts Mean Var CV

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
xlim = c(0, max(Sample[knot.n+2,2,]))
  plot( cuts.to.PLFN(Sample[,,1]), type="b", xlim=xlim ) 
  plot( cuts.to.PLFN(Sample[,,2]), type="b", add=TRUE ) 
  plot( cuts.to.PLFN(Sample[,,3]), type="b", add=TRUE ) 
  abline( h=round((knot.n+1):0/(knot.n+1),4), lty=3, col="gray70") 


plot(Mean(Sample), col=4, lwd=2, add=TRUE, type="b")
plot(Var(Sample), col=3, lwd=2, add=TRUE, type="b")

S = Sd(Sample)
S
PLFN.to.cuts(S, knot.n)
plot(S, col=2, lwd=2, add=TRUE, type="b")



