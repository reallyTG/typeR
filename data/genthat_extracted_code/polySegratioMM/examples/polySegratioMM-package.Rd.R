library(polySegratioMM)


### Name: polySegratioMM-package
### Title: Bayesian Mixture Models for Marker Dosage in Autopolyploids
### Aliases: polySegratioMM-package polySegratioMM
### Keywords: package manip

### ** Examples

## simulate small autooctaploid data set of 100 markers for 50 individuals
## with %70 Single, %20 Double and %10 Triple Dose markers 
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=400,n.individuals=275)
##print(a1)
sr <-  segregationRatios(a1$markers)
x <- setModel(3,8)  # autooctapolid mode with 3 components

## Not run: 
##D ## fit simple model in one hit with default priors, inits etc
##D ## warning: this is too small an MCMC sample so should give inaccurate
##D ## answers but it could still take quite a while
##D x.run <- runSegratioMM(sr, x, burn.in=2000, sample=5000)
##D print(x.run)
##D 
##D ## plot observed segregation ratios, fitted model and expected distribution
##D plot(x.run, theoretical=TRUE)
## End(Not run)



