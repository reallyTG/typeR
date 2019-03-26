library(polySegratioMM)


### Name: print.runJags
### Title: Running JAGS
### Aliases: print.runJags print.runJagsWrapper
### Keywords: manip

### ** Examples

## simulate small autooctaploid data set
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=100,n.individuals=50)
##print(a1)
sr <-  segregationRatios(a1$markers)
x <- setModel(3,8)

## Not run: 
##D ## fit simple model in one hit
##D 
##D x.run <- runSegratioMM(sr, x, burn.in=200, sample=500)
##D print(x.run)
## End(Not run)



