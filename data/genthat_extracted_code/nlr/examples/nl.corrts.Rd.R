library(nlr)


### Name: nl.corrts
### Title: Autocorrelated two stage estimate
### Aliases: nl.corrts
### Keywords: autocorrelated erro two stage estimate robust two stage
###   estimate

### ** Examples

library(nlme)
xr = tadr.ir[, 1]
yr = tadr.ir[, 2]
a1 <-  nl.corrts( nlrobj5[[18]],data=list(xr = xr, yr = yr),correlation=corAR1(0.8))
a1$parameters              



