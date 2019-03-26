library(copBasic)


### Name: psepolar
### Title: Pseudo-Polar Representation of Bivariate Data
### Aliases: psepolar
### Keywords: copula (goodness-of-fit) copula (inference) inference
###   goodness-of-fit pseudo-polar representation

### ** Examples

## Not run: 
##D pse <- psepolar(simCOP(n=799, cop=PARETOcop, para=4.3,graphics=FALSE),bound.type="Carv")
##D pse <- pse$table # The Pareto copula has right-tail extreme dependency
##D plot(1/(1-pse$U), 1/(1-pse$V), col=pse$Shat_ge_Sf+1, lwd=0.8, cex=0.5, log="xy", pch=16)
##D plot(pse$What, pse$Shat, log="y", col=pse$Shat_ge_Sf+1, lwd=0.8, cex=0.5, pch=16)
##D plot(density(pse$What[pse$Shat_ge_Sf]), pch=16, xlim=c(0,1)) # then try the
##D # non-right tail extremal copula PSP as cop=PSP in the above psepolar() call. 
## End(Not run)



