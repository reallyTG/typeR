library(copBasic)


### Name: rhobevCOP
### Title: A Dependence Measure for a Bivariate Extreme Value Copula based
###   on the Expectation of the Product of Negated Log-Transformed Random
###   Variables U and V
### Aliases: rhobevCOP
### Keywords: copula (characteristics) copula (properties) copula
###   (properties, extreme value)

### ** Examples

Theta <- GHcop(tau=1/3)$para     # Gumbel-Hougaard copula with Kendall Tau = 1/3
rhobevCOP(cop=GHcop, para=Theta) # 0.3689268 (RhoE after Joe [2014])
rhoCOP(   cop=GHcop, para=Theta) # 0.4766613 (Spearman's Rho)
## Not run: 
##D set.seed(394)
##D simUV <- simCOP(n=30000, cop=GHcop, para=Theta, graphics=FALSE) # large simulation
##D samUV <- simUV * 150; n <- length(samUV[,1]) # convert to fake unit system
##D samUV[,1] <- rank(simUV[,1]-0.5)/n; samUV[,2] <- rank(simUV[,2]-0.5)/n # hazen
##D rhobevCOP(para=samUV, as.sample=TRUE) # 0.3708275
## End(Not run)



