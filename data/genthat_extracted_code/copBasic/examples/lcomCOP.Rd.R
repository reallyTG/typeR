library(copBasic)


### Name: lcomCOP
### Title: L-comoments and Bivariate L-moments of a Copula
### Aliases: lcomCOP
### Keywords: bivariate asymmetry (measures) bivariate skewness bivariate
###   L-moments L-comoments

### ** Examples

## Not run: 
##D para <- list(alpha=0.5, beta=0.93, para1=4.5, cop1=GLcop, cop2=PSP)
##D copBasic:::lcomCOP(cop=composite2COP, para=para)$lcomUV[3]
##D # Lcomom:T3[12]=  +0.156
##D copBasic:::lcomCOP(cop=composite2COP, para=para)$lcomVU[3]
##D # Lcomom:T3[21]=  -0.0668
##D bilmoms(cop=composite2COP, n=10000, para=para, sobol=TRUE)$bilcomoms$T3
##D # Tau3[12]=+0.1566, Tau3[21]=-0.0655
##D # The numerical default Monte Carlo integration of bilmoms()
##D # matches the numerical integration of lcomCOP albeit with a
##D # substantially slower and less elegant means in bilmoms().
## End(Not run)



