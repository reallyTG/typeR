library(compositions)


### Name: totals
### Title: Total sum of amounts
### Aliases: totals totals.acomp totals.aplus totals.rcomp totals.rplus
###   totals.ccomp
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)
totals(acomp(sa.lognormals))
totals(rcomp(sa.lognormals,total=100))
totals(aplus(sa.lognormals))
totals(rplus(sa.lognormals))
aplus(acomp(sa.lognormals),total=totals(aplus(sa.lognormals)))





