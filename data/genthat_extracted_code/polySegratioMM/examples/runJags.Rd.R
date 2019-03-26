library(polySegratioMM)


### Name: runJags
### Title: Run JAGS to create MCMC sample for segregation ratio mixture
###   model
### Aliases: runJags
### Keywords: manip

### ** Examples

## simulate small autooctaploid data set
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=100,n.individuals=50)
sr <-  segregationRatios(a1$markers)

## set up model with 3 components
x <- setModel(3,8)
x2 <- setPriors(x)
dumpData(sr, x)
inits <- setInits(x,x2)
dumpInits(inits)
##x.priors <- setPriors(x, "vague")
writeJagsFile(x, x2, stem="test")

## Not run: 
##D small <- setControl(x, burn.in=20, sample=50)
##D writeControlFile(small)
##D rj <- runJags(small)  ## just run it
##D print(rj)
## End(Not run)



