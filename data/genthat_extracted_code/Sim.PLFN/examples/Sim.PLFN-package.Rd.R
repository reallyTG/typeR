library(Sim.PLFN)


### Name: Sim.PLFN-package
### Title: Simulation of Piecewise Linear Fuzzy Numbers
### Aliases: Sim.PLFN-package Sim.PLFN
### Keywords: TriangularFuzzyNumber TrapezoidalFuzzyNumber FuzzyNumber
###   PowerFuzzyNumber PLFN S.PLFN PLFN.to.cuts Mean Var Sd CV

### ** Examples

library(FuzzyNumbers)

# Example 1: Let  x ~~ ( X~N(0,.2) ; s_X^l~Exp(3) ; s_X^r~beta(1,3) )  
n=3; knot.n=3
Sample <- S.PLFN( n, knot.n, type="PLFI",
			X.dist="norm", X.dist.par=c(0,.2),
			slX.dist="exp", slX.dist.par=3,
			srX.dist="beta", srX.dist.par=c(1,3)
			)
Sample
Sample[,,3]

# For plotting random fuzzy sample:
xlim = c( min(Sample), max(Sample) )
  plot( cuts.to.PLFN(Sample[,,1]), type="o", xlim=xlim ) 
  plot( cuts.to.PLFN(Sample[,,2]), type="o", add=TRUE ) 
  plot( cuts.to.PLFN(Sample[,,3]), type="o", add=TRUE ) 
  abline( h=round((knot.n+1):0/(knot.n+1),4), lty=3, col="gray70") 



# Example 2: 
n=9; knot.n=9
Sample <- S.PLFN( n, knot.n, 
	X.dist="norm", X.dist.par=c(5,2),
	slX.dist="chisq", slX.dist.par=1,
	srX.dist="unif", srX.dist.par=c(0,3)
	)
Sample
Sample[,,9]

# For plotting random fuzzy sample:
xlim = c( min(Sample), max(Sample) )
  plot( cuts.to.PLFN(Sample[,,1]), type="b", col=1, xlim=xlim ) 
  plot( cuts.to.PLFN(Sample[,,2]), type="b", col=2, add=TRUE ) 
  plot( cuts.to.PLFN(Sample[,,3]), type="b", col=3, add=TRUE ) 
  plot( cuts.to.PLFN(Sample[,,4]), type="b", col=4, add=TRUE ) 
  plot( cuts.to.PLFN(Sample[,,5]), type="b", col=5, add=TRUE ) 
  plot( cuts.to.PLFN(Sample[,,6]), type="b", col=6, add=TRUE ) 
  plot( cuts.to.PLFN(Sample[,,7]), type="b", col=7, add=TRUE ) 
  plot( cuts.to.PLFN(Sample[,,8]), type="b", col=8, add=TRUE ) 
  plot( cuts.to.PLFN(Sample[,,9]), type="b", col=9, add=TRUE ) 

  abline( h=round((knot.n+1):0/(knot.n+1),4), lty=3, col="gray70") 



# Example 3: (Four Arithmatic Operations on PLFNs)

if(!require(FuzzyNumbers)){install.packages("FuzzyNumbers")}
library(FuzzyNumbers)

Sample <- S.PLFN( n=2, knot.n=9,
			X.dist="unif", X.dist.par=c(1,3),
			slX.dist="beta", slX.dist.par=c(4,3),
			srX.dist="beta", srX.dist.par=c(1/3,2/3)
			)
Sample

# For plotting random fuzzy sample:
xlim = c( min(Sample), max(Sample) )
  plot( cuts.to.PLFN(Sample[,,1]), type="b", xlim=xlim ) 
  plot( cuts.to.PLFN(Sample[,,2]), type="b", add=TRUE ) 
  abline( h=round((knot.n+1):0/(knot.n+1),4), lty=3, col="gray70") 


X1 = cuts.to.PLFN( Sample[,,1] )
X2 = cuts.to.PLFN( Sample[,,2] )

### Now working with four arithmatic operations +, _, * and / are simple as follows:

summ = X1 + X2 ;  summ
dist = X1 - X2 ;  dist
prod = X1 * X2 ;  prod
divi = X1 / X2 ;  divi

xlim = c(min(summ["a1"],dist["a1"],prod["a1"],divi["a1"]),
         max(summ["a4"],dist["a4"],prod["a4"],divi["a4"]) ) 

# For plotting random fuzzy sample:
  plot( cuts.to.PLFN(Sample[,,1]), type="b", xlim=xlim ) 
  plot( cuts.to.PLFN(Sample[,,2]), type="b", add=TRUE ) 
  abline( h=round((knot.n+1):0/(knot.n+1),4), lty=3, col="gray70") 

plot(summ, type="b", xlim=c(0, 12), add=TRUE, col=2, lwd=2)
plot(dist, type="b", xlim=c(0, 12), add=TRUE, col=3, lwd=2)
plot(prod, type="b", xlim=c(0, 12), add=TRUE, col=4, lwd=2)
plot(divi, type="b", xlim=c(0, 12), add=TRUE, col=5, lwd=2)

abline(v=c(X1["a2"],X2["a2"],summ["a2"],dist["a2"],prod["a2"],divi["a2"]), col=
       c(1,1,2,3,4,5), lty=3)
legend( "topright", c("X1 & X2", "X1 + X2", "X1 - X2", "X1 * X2", "X1 / X2"), col=1:5, 
       text.col = 1, lwd=2 )



