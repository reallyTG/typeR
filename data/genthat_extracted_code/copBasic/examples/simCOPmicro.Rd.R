library(copBasic)


### Name: simCOPmicro
### Title: Simulate V from U through a Copula by Numerical Derivative
###   Method
### Aliases: simCOPmicro simCOPv
### Keywords: copula (simulation) copula (conditional distribution) copula
###   (conditional quantile function) copula (reflection)

### ** Examples

simCOPmicro(runif(1), cop=W)   # Frechet lower bound copula
simCOPmicro(runif(1), cop=P)   # Independence copula
simCOPmicro(runif(1), cop=M)   # Frechet upper bound copula
simCOPmicro(runif(1), cop=PSP) # The PSP copula

# Now let us get more complicated and mix two Plackett copulas together using the
# composite2COP as a "compositor." The parameter argument becomes more complex, but is
# passed as shown into composite2COP.
para <- list(cop1=PLACKETTcop,cop2=PLACKETTcop, alpha=0.3,beta=0.5, para1=0.1,para2=50)
simCOPmicro(runif(5), cop=composite2COP, para=para)

## Not run: 
##D # Now let us implement "our" own version of features of simCOP() but using
##D # the micro version to manually create just the simulation vector of V.
##D U <- runif(1500)
##D UV <- data.frame(U, simCOPmicro(U, cop=N4212cop, para=4))
##D plot(UV, xlab="PROBABILITY IN U", ylab="PROBABILITY IN V", pch=3, col=2) #
## End(Not run)



