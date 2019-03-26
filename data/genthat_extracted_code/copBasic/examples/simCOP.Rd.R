library(copBasic)


### Name: simCOP
### Title: Simulate a Copula by Numerical Derivative Method
### Aliases: simCOP rCOP
### Keywords: copula (simulation) visualization

### ** Examples

simCOP(n=5, cop=PARETOcop, para=2.4)

## Not run: 
##D # The simCOP function is oft used in other Examples sections through this package.
##D simCOP(n=10, cop=W)            # Frechet lower bound copula
##D simCOP(n=10, cop=P)            # Independence copula
##D simCOP(n=10, cop=M, col=2)     # Frechet upper bound copula
##D simCOP(n=10, cop=PSP)          # The PSP copula
## End(Not run)

## Not run: 
##D # Now simulate the PSP copula, add the level curves of the copula, and demonstrate
##D # the uniform distribution of marginals on the correct axes (U [top] and V [left]).
##D D <- simCOP(n=400, cop=PSP) # store simulated values in D
##D level.curvesCOP(cop=PSP, ploton=FALSE)
##D rug(D$U, side=3, col=2); rug(D$V, side=4, col=2)
##D 
##D # Now let us get more complicated and mix two Plackett copulas together using the
##D # composite2COP as a "compositor." The parameter argument becomes more complex, but
##D # is passed as shown into composite2COP.
##D para <- list(cop1=PLACKETTcop,cop2=PLACKETTcop, alpha=0.3,beta=0.5, para1=0.1,para2=50)
##D D <- simCOP(n=950, cop=composite2COP, para=para, col=rgb(0,0,0,0.2), pch=16, snv=TRUE)#
## End(Not run)



