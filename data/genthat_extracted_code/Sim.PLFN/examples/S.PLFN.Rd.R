library(Sim.PLFN)


### Name: S.PLFN
### Title: Simulate a random sample from Piecewise Linear Fuzzy Numbers
### Aliases: S.PLFN
### Keywords: TriangularFuzzyNumber TrapezoidalFuzzyNumber FuzzyNumber
###   PowerFuzzyNumber PLFN PLFN.to.cuts Mean Var Sd CV

### ** Examples

library(FuzzyNumbers)

# Let  x ~~ ( X~N(0,1) ; s_X^l~Exp(3) ; s_X^r~beta(1,3) )  

n=3; knot.n=3

Sam <- S.PLFN( n=3, knot.n=4, type="Tra",
	X.dist="norm", X.dist.par=c(0,1),
	slX.dist="exp", slX.dist.par=3,
	srX.dist="beta", srX.dist.par=c(1,3)
	)

Sam
Sam[,,"X3"]

# For plotting random fuzzy sample:
xlim = c( min(Sam), max(Sam) )
  plot( cuts.to.PLFN(Sam[,,1]), type="b", col=1, xlim=xlim ) 
  plot( cuts.to.PLFN(Sam[,,2]), type="b", col=2, add=TRUE ) 
  plot( cuts.to.PLFN(Sam[,,3]), type="b", col=3, add=TRUE ) 
  abline( h=round((knot.n+1):0/(knot.n+1),4), lty=3, col="gray70") 



