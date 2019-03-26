library(distrTeach)


### Name: illustrateCLT
### Title: Functions for Illustrating the CLT
### Aliases: illustrateCLT illustrateCLT.tcl
### Keywords: distribution methods dynamic

### ** Examples

distroptions("DefaultNrFFTGridPointsExponent" = 13)
illustrateCLT(Distr = Unif(), len = 20)
distroptions("DefaultNrFFTGridPointsExponent" = 12)
illustrateCLT(Distr = Pois(lambda = 2), len = 20)
distroptions("DefaultNrFFTGridPointsExponent" = 13)
illustrateCLT(Distr = Pois(lambda = 2)+Unif(), len = 20)
illustrateCLT.tcl(Distr = Unif(), k = 4, "Unif()")



