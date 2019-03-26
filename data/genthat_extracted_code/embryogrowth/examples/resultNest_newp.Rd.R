library(embryogrowth)


### Name: resultNest_newp
### Title: Fit using the nest database with anchored parameters
### Aliases: resultNest_newp
### Keywords: datasets

### ** Examples

## Not run: 
##D library(embryogrowth)
##D data(nest)
##D formated <- FormatNests(nest)
##D newp <- GenerateAnchor(nests=formated, number.anchors=7)
##D pfixed <- c(rK=2.093313)
##D resultNest_newp <- searchR(parameters=newp, fixed.parameters=pfixed, 
##D   temperatures=formated, derivate=dydt.Gompertz, M0=1.7, 
##D 	test=c(Mean=39.33, SD=1.92))
##D data(resultNest_newp)
##D plotR(resultNest_newp)
## End(Not run)



