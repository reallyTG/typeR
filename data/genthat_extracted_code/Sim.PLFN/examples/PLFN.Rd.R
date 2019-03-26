library(Sim.PLFN)


### Name: PLFN
### Title: Simulate a random Piecewise Linear Fuzzy Number
### Aliases: PLFN
### Keywords: TriangularFuzzyNumber TrapezoidalFuzzyNumber FuzzyNumber
###   PowerFuzzyNumber S.PLFN PLFN.to.cuts Mean Var Sd CV

### ** Examples

# Example:  Let x ~~ ( X~N(3,0.2) ; s_X^l~Exp(3) ; s_X^r~U(0,2) )  

if(!require(FuzzyNumbers)){install.packages("FuzzyNumbers")}
library(FuzzyNumbers)

knot.n = 2
P <- PLFN( knot.n, type="Tri",
	     X.dist="norm", X.dist.par=c(3,.2),
	     slX.dist="exp", slX.dist.par=3,
	     srX.dist="unif", srX.dist.par=c(0,2)
	    )
P
plot(P, lwd=3, type="b")
abline( h=round((knot.n+1):0/(knot.n+1),4), v=alphacut(P, round((knot.n+1):0/(knot.n+1),4) ),
        lty=3, col=2  ) 


P <- PLFN( knot.n, type="Tra",
	     X.dist="norm", X.dist.par=c(3,1),
	     slX.dist="exp", slX.dist.par=3,
	     srX.dist="unif", srX.dist.par=c(0,2)
	    )
plot(P, lwd=3, type="b")
abline( h=round((knot.n+1):0/(knot.n+1),4), v=alphacut(P, round((knot.n+1):0/(knot.n+1),4) ),
                lty=3, col=2  ) 


knot.n = 2
P <- PLFN( knot.n,			#Defult:  type="PLFN" 
	     X.dist="norm", X.dist.par=c(3,1),
	     slX.dist="exp", slX.dist.par=3,
	     srX.dist="unif", srX.dist.par=c(0,2)
	    )
plot(P, lwd=3)
abline( h=round((knot.n+1):0/(knot.n+1),4), v=alphacut(P, round((knot.n+1):0/(knot.n+1),4) ),
        lty=3, col=2  ) 
#Try once again by knot.n=10


knot.n = 2
P <- PLFN( knot.n, type="PLFI",
	     X.dist="norm", X.dist.par=c(3,1),
	     slX.dist="exp", slX.dist.par=3,
	     srX.dist="unif", srX.dist.par=c(0,2)
	    )
plot(P, lwd=3, type="b")
abline( h=round((knot.n+1):0/(knot.n+1),4), v=alphacut(P, round((knot.n+1):0/(knot.n+1),4) ),
        lty=3, col=2  ) 

plot(P, type="b", col=2, lty=1, lwd=3, add=FALSE)
# Some of possible types are:
  #  "p" for points, 
  #  "l" for lines, 
  #  "b" for both, 
  #  "c" for the lines part alone of "b", 
  #  "o" for both over plotted, 
  #  "h" for histogram like (or high-density) vertical lines, 
  #  "s" for stair steps, 
  #  "S" for other steps, 
  #  "n" for no plotting. 


P
P["a1"] #First point of support
P["a2"] #First point of core
P["a3"] #End point of core
P["a4"] #End point of support

core(P)
supp(P)
alphacut(P, 0.5)
abline(h=.5, lty=3)

evaluate(P, 3.5)
round( evaluate(P, seq(0,4, by=.5)), 2)



