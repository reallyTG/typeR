library(polySegratioMM)


### Name: plot.segratioMCMC
### Title: MCMC plots for segregation ratio mixture models
### Aliases: plot.segratioMCMC
### Keywords: manip

### ** Examples

## simulate small autooctaploid data set
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=100,n.individuals=50)
##print(a1)
sr <-  segregationRatios(a1$markers)
x <- setModel(3,8)

## Not run: 
##D ## fit simple model in one hit and summarise
##D 
##D x.run <- runSegratioMM(sr, x, burn.in=200, sample=500)
##D plot(x.run$mcmc.mixture)
## End(Not run)



