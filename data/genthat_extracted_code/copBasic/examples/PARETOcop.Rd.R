library(copBasic)


### Name: PARETOcop
### Title: The Pareto Copula
### Aliases: PARETOcop PAcop
### Keywords: Pareto copula copula (formulas) copula

### ** Examples

## Not run: 
##D z <- seq(0.01,0.99, by=0.01) # Both copulas have Kendall Tau = 1/3
##D plot( z, kfuncCOP(z, cop=PAcop, para=1), lwd=2,
##D                                 xlab="z <= Z", ylab="F_K(z)", type="l")
##D lines(z, kfuncCOP(z, cop=GHcop, para=1.5), lwd=2, col=2) # red line
##D # All extreme value copulas have the same Kendall Function [F_K(z)], the
##D # Gumbel-Hougaard is such a copula and the F_K(z) for the Pareto does not
##D # plot on top and thus is not an extreme value but shares a "closeness."
## End(Not run)



