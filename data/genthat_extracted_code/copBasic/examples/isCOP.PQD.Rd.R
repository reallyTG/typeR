library(copBasic)


### Name: isCOP.PQD
### Title: The Positively Quadrant Dependency State of a Copula
### Aliases: isCOP.PQD
### Keywords: copula (characteristics) copula (properties)

### ** Examples

## Not run: 
##D isCOP.PQD(cop=PSP) # TRUE
## End(Not run)

## Not run: 
##D # Example concerning Empirical Bivariate Copula and sample versions for comparison.
##D set.seed(10); n <- 1000
##D para <- list(cop1=PLACKETTcop, cop2=PLACKETTcop, para1=0.145,  para2=1.45,
##D              alpha=0.81, beta=0.8)
##D D <- simCOP(n=n, cop=composite2COP, para=para, cex=0.5, col=rgb(0,0,0,0.2), pch=16)
##D #tauCOP(cop=EMPIRcop, para=D)   # ??? but == 1
##D cor(D$U, D$V, method="kendall") # -0.3224705
##D blomCOP(cop=EMPIRcop, para=D)   # -0.332
##D giniCOP(cop=EMPIRcop, para=D)   # -0.3692037
##D GINI <- sum(abs(rank(D$U)+rank(D$V)-n-1)) - sum(abs(rank(D$U)-rank(D$V)))
##D print(GINI/as.integer(n^2/2))   # -0.369996
##D rhoCOP(cop=EMPIRcop, para=D)    # ??? but fails
##D cor(D$U, D$V, method="spearman")      # -0.456694
##D lmomco::lcomoms2(D)$T2     #  1.0000000 -0.4568357
##D                            # -0.4567859  1.0000000
## End(Not run)



