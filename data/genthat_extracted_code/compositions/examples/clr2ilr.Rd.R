library(compositions)


### Name: clr2ilr
### Title: Convert between clr and ilr, and between cpt and ipt.
### Aliases: clr2ilr ilr2clr clrvar2ilr ilrvar2clr
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)
ilrInv(clr2ilr(clr(sa.lognormals)))-clo(sa.lognormals)
clrInv(ilr2clr(ilr(sa.lognormals)))-clo(sa.lognormals)
ilrvar2clr(var(ilr(sa.lognormals)))-var(clr(sa.lognormals))
clrvar2ilr(var(cpt(sa.lognormals)))-var(ipt(sa.lognormals))




