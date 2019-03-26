library(nlr)


### Name: nl.robcorrts
### Title: Robust two stage estimate
### Aliases: nl.robcorrts dfr.robcorrts
### Keywords: autocorrelated erro two stage estimate robust two stage
###   estimate

### ** Examples

xr = trade.ir[, 1]
yr = trade.ir[, 2]
a1 <-  nl.robcorrts( nlrobj5[[18]],data=list(xr = xr, yr = yr),
correlation=list(StructName="corAR1"),
robfunc = nl.robfuncs[["hampel"]])
a1$parameters 



