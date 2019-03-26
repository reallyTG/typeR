library(polySegratioMM)


### Name: plotFitted
### Title: Plot observed segregation ratios and fitted and theoretical
###   models
### Aliases: plotFitted plotTheoretical plot.runJagsWrapper
### Keywords: manip

### ** Examples

## simulate small autooctaploid data set
plotTheoretical(8, proportion=c(0.7,0.2,0.1),n.individuals=50)
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=100,n.individuals=50)
##print(a1)
sr <-  segregationRatios(a1$markers)
x <- setModel(3,8)

## fit simple model in one hit and summarise
## Not run: 
##D x.run <- runSegratioMM(sr, x, burn.in=200, sample=500)
##D print(x.run)
##D 
##D ## plot fitted model using 'plotFitted'
##D plotFitted(sr, x.run$summary)
##D a.plot <- plotFitted(sr, x.run$summary, density.plot=TRUE)
##D print(a.plot)
##D ## or the easier way
##D plot(x.run, theoretical=TRUE)
## End(Not run)



