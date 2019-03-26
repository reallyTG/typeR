library(copBasic)


### Name: bilmoms
### Title: Bivariate L-moments and L-comoments of a Copula
### Aliases: bilmoms
### Keywords: bivariate asymmetry (measures) bivariate skewness bivariate
###   L-moments Nelsen (2006) Examples and Exercises Sobol sequence (Monte
###   Carlo integration) L-comoments

### ** Examples

## Not run: 
##D para <- list(alpha=0.5, beta=0.93, para1=4.5, cop1=GLcop, cop2=PSP)
##D bilmoms(cop=composite2COP, n=10000, para=para, sobol=TRUE)$bilcomoms$T3
##D # results: Tau3[12]=0.155, Tau3[21]=-0.0667 (Monte Carlo)
##D lcomCOP(cop=composite2COP, para=para, orders=3)
##D # results: Tau3[12]=0.156, Tau3[21]=-0.0668 (direct integration)
## End(Not run)

## Not run: 
##D UVsim <- simCOP(n=20000, cop=composite2COP, para=para, graphics=FALSE)
##D samLcom <- lmomco::lcomoms2(UVsim, nmom=5) # sample algorithm
##D # results: Tau3[12]=0.1489, Tau3[21]=-0.0679 (simulation)
## End(Not run)



