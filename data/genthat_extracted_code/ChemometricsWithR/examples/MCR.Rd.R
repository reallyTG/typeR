library(ChemometricsWithR)


### Name: MCR
### Title: Functions for Multivariate Curve Resolution
### Aliases: MCR mcr opa efa
### Keywords: manip

### ** Examples

## Not run: 
##D if (require("ChemometricsWithRData")) {
##D   data(bdata, package = "ChemometricsWithRData")
##D   D1.efa <- efa(bdata$d1, 3)
##D   matplot(D1.efa$forward, type = "l")
##D   matplot(D1.efa$backward, type = "l")
##D   matplot(D1.efa$pure.comp, type = "l")
##D 
##D   D1.opa <- opa(bdata$d1, 3)
##D   matplot(D1.opa$pure.comp, type = "l")
##D 
##D   D1.mcr.efa <- mcr(bdata$d1, D1.efa$pure.comp, what = "col")
##D   matplot(D1.mcr.efa$C, type = "l", main = "Concentration profiles")
##D   matplot(t(D1.mcr.efa$S), type = "l", main = "Pure spectra")
##D   }
## End(Not run)



