library(compositions)


### Name: acompmargin
### Title: Marginal compositions in Aitchison Compositions
### Aliases: acompmargin
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)
plot.acomp(sa.lognormals5,margin="acomp")
plot.acomp(acompmargin(sa.lognormals5,c("Pb","Zn")))
plot.acomp(acompmargin(sa.lognormals5,c(1,2)))



