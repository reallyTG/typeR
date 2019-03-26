library(acopula)


### Name: nintegrate
### Title: Numerical integration
### Aliases: nintegrate
### Keywords: integral trapezoid

### ** Examples

##cumulative distribution function of a bivariate normal copula 
##evaluated at point c(0.5,0.6); compare pCopula(c(0.5,0.6),cop=copNormal(),par=0.5)
nintegrate(function(x) dCopula(x,cop=copNormal(),par=0.5), 
  lower=0.001, upper=c(0.5,0.6), subdivisions=20) 



