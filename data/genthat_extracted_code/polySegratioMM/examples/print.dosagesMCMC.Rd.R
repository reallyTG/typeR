library(polySegratioMM)


### Name: print.dosagesMCMC
### Title: Doses from Bayesian mixture model
### Aliases: print.dosagesMCMC print.segratioMCMC
### Keywords: manip

### ** Examples

## simulate small autooctaploid data set
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=100,n.individuals=50)
##print(a1)
sr <-  segregationRatios(a1$markers)
x <- setModel(3,8)

## fit simple model in one hit

## Not run: 
##D x.run <- runSegratioMM(sr, x, burn.in=200, sample=500)
##D 
##D print(x.run$doses)
## End(Not run)



